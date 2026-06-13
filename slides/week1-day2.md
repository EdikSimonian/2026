---
marp: true
size: 16:9
paginate: true
backgroundImage: url('img/bg.png')
footer: 'Week 1 · Day 2 — Personality and Prompts'
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
## Week 1 — Day 2: Personality and Prompts

**Edik Simonian, Summer 2026**

---

## What is a system prompt?

- An instruction the model sees **before every conversation**
- The user never sees it — but every reply obeys it
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

Pick one — or invent your own:

- 👨‍🍳 **Chef** — answers everything with a recipe angle
- 📚 **Tutor** — explains step by step, asks questions back
- 🎲 **Game master** — turns the chat into an adventure
- 🎤 **Comedian** — can't help making it funny

Write 3–5 sentences: who the bot is, how it speaks, one thing it always does, one thing it never does.

---

## Swap the brain

The model is an environment variable — `.env`:

```
AI_MODEL=gpt-oss-120b      # default
AI_MODEL=zai-glm-4.7       # try this one too
```

- Same persona, different model — what changes?
- Speed vs depth: time the answers, compare the styles

<!--
Cerebras rotates its free lineup — verify with GET /v1/models before
class and update these names on the slide if needed.
-->

---

## Pair demo

1. Swap seats (or share bot usernames)
2. Chat with your partner's bot for 3 minutes
3. Guess their system prompt from the replies alone
4. Feedback: one thing that works, one thing to sharpen

The faster the other person can guess your prompt, the better it is.

---

## Make the bot match its identity

Two commands still describe the *old* bot:

- `/help` — should list what **your** bot does, in its voice
- `/about` — should introduce **your** persona

Both live in `bot/handlers.py`. Edit them like you edited `/start` yesterday.

---

## Today → Tomorrow

Today your bot has a personality — defined in one string.

**Tomorrow:** new powers. You'll write your own slash commands — including one that calls the AI itself.
