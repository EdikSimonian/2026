---
marp: true
size: 16:9
paginate: true
backgroundImage: url('img/bg.png')
footer: 'Week 1 · Day 3 · New Commands'
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
## Week 1, Day 3: New Commands

**Edik Simonian, Summer 2026**

---

## Decorators in 60 seconds

```python
@bot.message_handler(commands=["start"], func=is_allowed)
def cmd_start(message):
    ...
```

- A decorator **registers** your function with the bot
- *"When a message matches `/start`, call this function"*
- You don't call `cmd_start` yourself; the bot does
- That's all you need to know to add any command

---

## The built-ins: read before you write

| Command | What it does |
|---|---|
| `/start` | Welcome message (you already edited it) |
| `/help` | Lists commands (you edited it yesterday) |
| `/reset` | Clears your conversation history |
| `/about` | Model, storage, and hosting info |

`/reset` clears *history*. Wait, what history? **That's tomorrow.**

---

## Live-code: `/joke`

```python
@bot.message_handler(commands=["joke"], func=is_allowed)
def cmd_joke(message):
    bot.send_message(
        message.chat.id,
        "Why do programmers prefer dark mode? Because light attracts bugs!",
    )
```

1. Add the handler to `bot/handlers.py`
2. Add `/joke` to `/help`
3. Restart, test

---

## Meet Claude Code

An **AI pair-programmer** that lives in your terminal.

- Reads your project: the real `bot/` files
- Writes code, runs commands, explains errors
- You ask in plain English; it edits and tests

You just built `/joke` by hand. Now meet the tool that helps you build the next one, *with you in charge*.

---

## Connect it to the workshop AI

**1. Install it** (once):

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

**2. Point it at the workshop gateway** (your key is handed out in class):

```bash
export ANTHROPIC_BASE_URL="https://ai.simonian.online"
export ANTHROPIC_AUTH_TOKEN="<your workshop key>"
export ANTHROPIC_MODEL="gemma26"
export ANTHROPIC_SMALL_FAST_MODEL="gemma26"
```

**3. Run it** from your project folder: `claude`

<!--
Instructor: confirm before class: the exact gateway base URL (no /v1; Caddy
routes to LiteLLM's Anthropic path), the model alias, and how each student
gets their key (gyumri-NN / yerevan-NN). Setting ANTHROPIC_AUTH_TOKEN skips
Claude Code's login prompt. Install alternatives: `npm i -g
@anthropic-ai/claude-code` (needs Node), or the PowerShell installer on
native Windows.
-->

---

## Use it, but stay the boss

Inside `claude`, just ask in plain English:

> *"Add a `/quote` command to `bot/handlers.py` that replies with a random quote, and list it in `/help`."*

- It edits the files, and can run the bot to test
- **Read every line it writes.** Can't explain it? Ask it to explain, or undo it
- *AI wrote it ≠ you understand it*. You'll read your code aloud in the review circle

Claude Code is the assistant. **You're the engineer.**

---

## Your turn: pick one

- `/quote`: a random quote from a list you write
- `/fact`: a surprising fact (keep a few in a Python list)
- `/roll`: a dice roll (`random.randint` is your friend)
- `/flip`: heads or tails

Same recipe as `/joke`: handler → `/help` entry → restart → test.

*Build the first by hand; pair with Claude Code on the next, but you explain it in the review circle.*

---

## Level up: commands that think

`/roast <name>`: read the words after the command, send them to the AI:

```python
@bot.message_handler(commands=["roast"], func=is_allowed)
def cmd_roast(message):
    name = message.text.split(maxsplit=1)[1] if " " in message.text else "you"
    reply = ask_ai(message.from_user.id, f"Write a short, playful, friendly roast of {name}.")
    bot.send_message(message.chat.id, reply)
```

`message.text.split()`: that's argument parsing.
*(The repo's `/model` handler does the same trick; it activates in Week 2.)*

---

## Lock it in with a test

- Open `tests/test_handlers.py`: see how `/start` is tested
- Write the same shape of test for **your** command
- `make test`: green locally
- `git push`: green on GitHub Actions too

A command without a test is a command that breaks silently later.

---

## Code review circle

1. Rotate one seat to your left, to your neighbor's screen
2. Read the handler on that screen **aloud**, line by line
3. Explain what each line does; ask if you can't
4. One compliment, one suggestion, then rotate back

Reading other people's code is half of real software engineering.

---

## Today → Tomorrow

Today your bot has custom commands: some static, one that thinks.

**Tomorrow:** memory. The bot remembers conversations across restarts, and you'll find out what `/reset` actually resets.
