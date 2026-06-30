---
marp: true
size: 16:9
paginate: true
backgroundImage: url('img/bg.png')
footer: 'Week 1 · Day 2 · Personality and Prompts (Windows · PowerShell)'
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
## Week 1, Day 2: Personality and Prompts — Windows

**Edik Simonian, Summer 2026**

<!--
NATIVE WINDOWS (Scoop + PowerShell) edition of Day 2, paired with
week1-day1-windows.md. Identical to the Mac/Linux deck (week1-day2.md) except
`make` -> `.\make.ps1` and the Claude Code connect: on this track the connect
script ships in the bot repo, so students run `.\make.ps1 claude KEY` from their
telegram-pythonanywhere-bot folder — no separate 2026 clone. See setup/WINDOWS.md.
-->

---

## What is a system prompt?

- An instruction the model sees **before every conversation**
- The user never sees it, but every reply obeys it
- It defines: who the bot is, how it talks, what it refuses to do
- **The most powerful single line in this project**

Same model + different system prompt = a completely different bot.

---

## Find it in the code

`bot/config.py`:

```python
SYSTEM_PROMPT = (
    "You are a knowledgeable and concise AI assistant. "
    "Answer clearly and directly. Avoid unnecessary filler. "
    "Keep responses appropriately brief for a chat interface."
)
```

Live experiment: change it to *"You answer only in rhymes."*
Restart. Ask it anything.

<!-- Demo this on the projector before students touch their own. -->

---

## Build your persona

Pick one, or invent your own:

- 👨‍🍳 **Chef**: answers everything with a recipe angle
- 📚 **Tutor**: explains step by step, asks questions back
- 🎲 **Game master**: turns the chat into an adventure
- 🎤 **Comedian**: can't help making it funny

Write 3–5 sentences: who the bot is, how it speaks, one thing it always does, one thing it never does.

---

## Swap the brain

The model is an environment variable in `.env`:

```
AI_MODEL=gpt-oss-120b      # default
AI_MODEL=zai-glm-4.7       # try this one too
```

- Same persona, different model: what changes?
- Speed vs depth: time the answers, compare the styles

<!--
Cerebras rotates its free lineup; verify with GET /v1/models before
class and update these names on the slide if needed.
-->

---

## Pair demo

1. Swap seats (or share bot usernames)
2. Chat with your partner's bot for 5 minutes
3. Guess their system prompt from the replies alone
4. Feedback: one thing that works, one thing to sharpen

The faster the other person can guess your prompt, the better it is.

---

## Make the bot match its identity

Two commands still describe the *old* bot:

- `/help`: should list what **your** bot does, in its voice
- `/about`: should introduce **your** persona

Both live in `bot/handlers.py`. Edit them like you edited `/start` yesterday.

---

## Meet Claude Code

An **AI pair-programmer** that lives in your terminal.

- Reads your project: the real `bot/` files
- Writes code, runs commands, explains errors
- You ask in plain English; it edits and tests

Today you shaped your bot by hand. Now meet the tool that helps you build the next thing, *with you in charge*.

---

## Connect it to the workshop AI

From your **bot folder** (`telegram-pythonanywhere-bot`), run the connect target:

```powershell
.\make.ps1 claude sk-your-key-here
```

Use the personal key handed out in class.

It checks the key, installs Claude Code if needed, points it at the workshop gateway, and launches `claude`. The connect script ships in this repo — nothing else to clone.

<!--
Instructor (native Windows): `.\make.ps1 claude` forwards to
setup/connect-claude-code.ps1 in the BOT repo — no separate 2026 clone needed
(the Mac/Linux/WSL track clones it only to reach connect-claude-code.sh). Confirm
before class: the exact gateway base URL (no /v1; Caddy routes to LiteLLM's
Anthropic path), the model alias, and how each student gets their key
(gyumri-NN / yerevan-NN). Setting ANTHROPIC_AUTH_TOKEN skips Claude Code's login
prompt. Manual env-var route: setup/CLAUDE-CODE.md "native Windows PowerShell".
-->

---

## Keep Claude Code connected

<style scoped>
section { font-size: 25px; }
section pre { font-size: 20px; }
section li { margin-bottom: 0.15em; }
</style>


Want new terminals to stay connected?

```powershell
.\make.ps1 claude sk-your-key-here -Persist
```

This saves the workshop settings in your PowerShell `$PROFILE`:

- the same personal class key
- the workshop gateway URL
- the model settings Claude Code needs

New terminal windows can run `claude` immediately.

> **Shared lab machine? Skip `-Persist`.** It writes your class key into the machine's PowerShell `$PROFILE`, where the next student would inherit it — run the plain command (previous slide) once per session instead.

<!--
Instructor (native Windows): -Persist on a shared machine leaves the student's
class key in their PowerShell $PROFILE for the next student — see setup/WINDOWS.md.
Cleanup: remove the workshop block from the file at $PROFILE.
-->

---

## Use it, but stay the boss

Inside `claude`, just ask in plain English:

> *"Update `/about` in `bot/handlers.py` to introduce my persona, in its voice."*

- It edits the files, and can run the bot to test
- **Read every line it writes.** Can't explain it? Ask it to explain, or undo it
- *AI wrote it ≠ you understand it*. You own every line you ship

Claude Code is the assistant. **You're the engineer.**

---

## Today → Tomorrow

Today your bot has a personality, and you've met Claude Code, your pair-programmer in the terminal.

**Tomorrow:** new powers. You'll write your own slash commands, including one that calls the AI itself, with Claude Code helping you build.
