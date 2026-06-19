---
marp: true
size: 16:9
paginate: true
backgroundImage: url('img/bg.png')
footer: 'Week 1 · Day 5 · Deploy and Ship'
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
/* Syntax colors tuned for the dark code background (overrides the default
   light highlight.js theme, whose dark tokens vanish on dark navy). */
pre code .hljs-comment, pre code .hljs-quote { color: #8b9bb4; font-style: italic; }
pre code .hljs-keyword, pre code .hljs-literal, pre code .hljs-type,
pre code .hljs-selector-tag { color: #c792ea; }
pre code .hljs-string, pre code .hljs-meta .hljs-string,
pre code .hljs-regexp, pre code .hljs-addition { color: #addb67; }
pre code .hljs-title, pre code .hljs-section, pre code .hljs-name { color: #82aaff; }
pre code .hljs-built_in, pre code .hljs-class .hljs-title { color: #ffcb6b; }
pre code .hljs-number, pre code .hljs-symbol, pre code .hljs-bullet { color: #f78c6c; }
pre code .hljs-attr, pre code .hljs-attribute,
pre code .hljs-variable, pre code .hljs-params { color: #eaf1f8; }
pre code .hljs-meta { color: #ffcb6b; }
pre code .hljs-property, pre code .hljs-subst { color: #eaf1f8; }
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

/* Cover slide: white text over a photo in normal flow (e.g. a closing slide) */
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
## Week 1, Day 5: Deploy and Ship

**Edik Simonian, Summer 2026**

---

## From polling to webhook

- All week: **polling**, your computer asks Telegram for updates
- Production: **webhook**, Telegram pushes to your server's URL
- PythonAnywhere runs the **same Flask app** as an always-on worker
- Same code, same `.env` idea: different delivery

Today your bot stops needing you.

---

## The front door: `api/index.py`

| Route | Job |
|---|---|
| `/api/health` | "Is the worker alive?" → `OK` |
| `/api/webhook` | Where Telegram delivers messages |
| `/api/deploy` | Pulls new code on push (we'll wire this up) |

- The webhook checks a **secret token**: forged requests get 403. The bot generates and registers it itself on first boot.
- `threaded=False` in `bot/clients.py`: handlers must finish in the request, or the platform may kill them mid-reply.

---

## Deploy: one command

1. Sign up at **pythonanywhere.com** (free Beginner tier)
2. Create an API token: *Account → API token*
3. Add to your local `.env`:

```
PA_USERNAME=<your PA username>
PA_API_TOKEN=<the token>
```

4. Ship it:

```bash
make deploy-pa
```

<!-- The script pauses once and asks you to open one URL in the browser; a PA quirk. -->

---

## What just happened

The script created the web app, cloned **your fork**, built the venv, uploaded a production `.env`, including:

```
SQLITE_PATH=/home/<you>/bot.db
WEBHOOK_URL=https://<you>.pythonanywhere.com/api/webhook
```

`WEBHOOK_URL` = auto-registration: every boot, the bot tells Telegram *"deliver here."* No manual `curl` needed.

---

## Verify like an engineer

1. `https://<you>.pythonanywhere.com/api/health` → `OK`
2. Message your bot: the reply now comes from the server
3. **Quit the bot on your computer (`Ctrl+C`). Message it again.** 🎉
4. Something wrong? *Web tab → error log*: read the traceback

---

## Push-to-deploy

One-time setup on your fork, in *Settings → Secrets → Actions*:

| Secret | Value |
|---|---|
| `DEPLOY_SECRET` | random string (also in PA `.env`) |
| `PA_DEPLOY_URL` | `https://<you>.pythonanywhere.com/api/deploy` |

Then:

```bash
git commit -am "New personality" && git push
```

**~3 seconds later the live bot is updated.** This is how real teams ship.

---

## The fine print ⚠️

- PA free tier: click **"Run until 3 months from today"**-style renewal **every month**, or the app auto-disables
- PA emails you a week before. Set a phone reminder anyway.
- Free tier limits outbound internet to a whitelist: Telegram and Cerebras are on it

---

## Final project: ship one original feature

- 🌍 Translator: Armenian ↔ English on demand
- ❓ Quiz master: asks, scores, keeps streaks (you have a store!)
- 🎭 Mood reader: guesses the mood of a message
- 📝 Summarizer: paste a wall of text, get three lines

Or your own idea. It must be **live on your deployed bot** by demo time.

---

## Demo day

1. Post your bot's username for the room
2. Try everyone's bot, find their feature
3. Vote: funniest persona, most useful feature, best surprise

**Same bot as Tuesday morning, now it lives on the internet.**

---

## Next week

Your bot's brain is someone else's model behind an API.

**Week 2: we train our own.** 63 GB of Armenian text, one GPU, a 350-million-parameter model, built from scratch, fine-tuned to chat, and plugged into *this* bot.
