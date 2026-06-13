---
marp: true
size: 16:9
paginate: true
backgroundImage: url('img/bg.png')
footer: 'Week 1 · Day 4 — Memory and State'
---

<style>
/* --- Workshop theme --- */
section {
  font-size: 30px;
  line-height: 1.45;
  color: #1c2733;
  justify-content: flex-start;
  padding: 64px 78px 84px;
  font-family: -apple-system, "Segoe UI", "Helvetica Neue", Arial, sans-serif;
}
h2 {
  font-size: 46px;
  color: #15365c;
  margin: 0 0 0.5em;
  padding-bottom: 0.18em;
  border-bottom: 3px solid #e8a04b;
}
h3 { font-size: 32px; color: #15365c; margin: 0.25em 0; }
strong { color: #c2561e; }
ul, ol { margin-top: 0.2em; }
li { margin-bottom: 0.4em; }
li > ul { margin-top: 0.3em; }
em { color: #4a5b6a; }
code {
  background: rgba(21, 54, 92, 0.09);
  padding: 2px 8px;
  border-radius: 6px;
  font-size: 0.86em;
}
pre {
  background: #0f2233;
  border-radius: 12px;
  padding: 20px 26px;
  font-size: 23px;
  line-height: 1.45;
  box-shadow: 0 10px 26px rgba(15, 34, 51, 0.20);
}
pre code { background: transparent; color: #eaf1f8; padding: 0; font-size: 1em; }
table { font-size: 27px; }
th { background: rgba(21, 54, 92, 0.10); }
blockquote {
  border-left: 5px solid #e8a04b;
  color: #4a5b6a;
  font-style: italic;
  padding-left: 0.7em;
  margin-left: 0;
}
.flow {
  text-align: center;
  font-size: 34px;
  font-weight: 700;
  color: #15365c;
  background: rgba(255, 255, 255, 0.55);
  border-radius: 14px;
  padding: 14px 10px;
  margin: 6px 0 24px;
}
footer { color: #6a7b8a; font-size: 16px; }

/* Title slide over the photo */
section.title {
  justify-content: center;
  color: #fff;
  position: relative;
}
section.title h1 {
  font-size: 58px;
  white-space: nowrap;
  color: #fff;
  margin-bottom: 0.1em;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.45);
}
section.title h2 {
  font-size: 40px;
  color: #fff;
  border: none;
  font-weight: 600;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.45);
}
section.title p {
  position: absolute;
  left: 78px;
  bottom: 52px;
  margin: 0;
}
section.title p, section.title strong {
  color: #fff;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
}

/* Cover slide — white text over a photo in normal flow (e.g. a closing slide) */
section.cover {
  justify-content: center;
  color: #fff;
}
section.cover h1 {
  color: #fff;
  border: none;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.45);
}
section.cover h2 {
  color: #fff;
  border: none;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.45);
}
section.cover p, section.cover strong, section.cover em {
  color: #fff;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
}
</style>

<!-- _class: title -->
<!-- _backgroundImage: url('img/title.jpg') -->
<!-- _paginate: false -->
<!-- _footer: '' -->

# AI & Software Engineering Workshop
## Week 1 — Day 4: Memory and State

**Edik Simonian, Summer 2026**

---

## The problem

1. Tell your bot: *"my favorite color is blue"*
2. Ask: *"what's my favorite color?"* — it knows ✓
3. Restart the bot. Ask again.
4. **It has no idea who you are.**

`Storage not configured — running in stateless mode` — today we fix that line.

---

## Key-value store = lockers

- A wall of lockers 🔐
- **Key** = the locker number → `chat:12345`
- **Value** = whatever you put inside → the conversation
- `get(key)` / `set(key, value)` — that's the whole API
- Ours also has **TTL**: lockers that empty themselves after 30 days

Redis, DynamoDB, memcached — same idea. Ours is SQLite: a database in a single file.

---

## Turn it on

`.env`:

```
SQLITE_PATH=./bot.db
```

- Restart → tell it your favorite color → restart again → ask
- **It remembers.** The file `bot.db` appeared — that's the memory
- No signup, no server, no credit card. It's just a file
- Delete the line → graceful fallback to stateless mode (try it)

---

## Live-code: `/remember` and `/recall`

```python
@bot.message_handler(commands=["remember"], func=is_allowed)
def cmd_remember(message):
    note = message.text.split(maxsplit=1)[1] if " " in message.text else ""
    store.set(f"note:{message.from_user.id}", note)
    bot.send_message(message.chat.id, "Saved!")
```

`/recall` is the mirror image: `store.get(f"note:{...}")`.

<!-- Assumes SQLITE_PATH is set so store is not None — say this out loud. -->

---

## Solo build: a full notes feature

- `/remember <text>` — add a note (not replace!)
- `/recall` — list **all** saved notes
- `/forget` — clear them

Hint: the store saves **strings**. To keep a list, `json.dumps` it on the way in, `json.loads` it on the way out.

---

## Production touches already in the repo

- **Rate limit** — `RATE_LIMIT` env var, default 250 messages/user/day
- **History trimming** — last 20 messages per user, 30-day expiry
- **Whitelist** — `ALLOWED_USERS` makes the bot **silent** to strangers
  *(silence, not rejection — scanners learn nothing)*
- **Dedupe** — Telegram retries webhooks; the bot won't answer twice

All built on the same store you just used.

---

## Debug challenge 🐛

The instructor just broke something in your bot.

- Symptom first: what *exactly* stopped working?
- `print()` is a debugger — trace the path of one message
- Found it? Don't fix it yet — explain it to your neighbor first

<!--
Good breaks: typo the store key prefix in history.py, flip the rate-limit
comparison, make /recall read a different key than /remember writes.
-->

---

## Today → Tomorrow

Today your bot remembers — conversations, notes, limits — all in one SQLite file.

**Tomorrow:** the internet. Your bot moves to a real server and answers while your laptop sleeps.
