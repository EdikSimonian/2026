---
marp: true
size: 16:9
paginate: true
backgroundImage: url('img/bg.png')
---

<!-- _backgroundImage: url('img/title.jpg') -->
<!-- _color: white -->
<!-- _paginate: false -->

# AI & Software Engineering Workshop
## Week 1 — Day 2: Personality and Prompts

**Edik Simonian**

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
