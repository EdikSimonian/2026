# AI & Software Engineering Workshop Curriculum

## Overview

- **Title:** AI & Software Engineering Workshop
- **Format:** Two-week intensive
- **Sessions:** 10 total (5 per week)
- **Arc:** Build → Train → Deploy
- **Locations:** Gyumri and Yerevan, Armenia
- **Structure:** Week 1 is identical in Gyumri and the first week in Yerevan. Week 2 is a second, separate week held in Yerevan.

### Week Summary

| Week | Focus | Hardware | Repository |
|------|-------|----------|------------|
| Week 1 | Building a Telegram Bot with AI | Any machine | https://github.com/EdikSimonian/telegram-vercel-bot |
| Week 2 | Training a Language Model from Scratch | RTX 4090 GPU | https://github.com/EdikSimonian/armenian-gpt |

---

## Week 1 — Building a Telegram Bot with AI

**Goal:** Ship a live, personalized Telegram bot backed by an LLM, deployed serverlessly on Vercel, with persistent memory and web search.

**Hardware required:** Any machine (laptop is enough — no GPU needed).

**Repository:** https://github.com/EdikSimonian/telegram-vercel-bot

**Stack used in Week 1:**
- **Telegram Bot API** — messaging interface
- **Vercel** — serverless hosting
- **Flask** (Python) — webhook handler
- **Cerebras** — LLM inference provider (free tier, no credit card)
- **Upstash Redis** — persistent key-value memory
- **Tavily** — web search API (free 1,000 searches/month)
- **GitHub** — source control

### Week 1 — Day 1: Setup and First Message

Topics and activities:
- What is a bot? How webhooks work vs polling — the two ways Telegram talks to your code.
- Walkthrough of the full stack: Telegram → Vercel → Flask → AI provider → reply.
- GitHub: create an account, clone the Week 1 repo, install dependencies.
- Telegram: create an account if needed, then message `@BotFather` to create a bot and get the bot token.
- Cerebras: sign up at cerebras.ai, create a free API key (no credit card required).
- Fill `.env` from the template with both the Telegram bot token and the Cerebras API key.
- Run `python run_local.py` — send the first message and see the reply in the terminal.
- First code edit: change the `/start` message to something personal.

### Week 1 — Day 2: Personality and Prompts

Topics and activities:
- What is a system prompt, and why it is the most powerful single line in the project.
- Live experiment: change `SYSTEM_PROMPT` in `config.py`, restart, and watch the bot transform.
- Build a themed bot — students pick their own persona: chef, tutor, game master, comedian, etc.
- Model comparison: swap `AI_MODEL` between `llama3.1-8b` (fast) and `qwen-3-235b` (smarter).
- Pair demo: students chat with each other's personas and give feedback.
- Update `/help` and `/about` commands to match the new bot identity.

### Week 1 — Day 3: New Commands

Topics and activities:
- How Python decorators work — just enough to understand `@bot.message_handler`.
- Live-code a `/joke` command together: write the handler, update `/help`, and test it.
- Solo build: each student picks one command to implement — `/quote`, `/fact`, `/roll`, or `/flip`.
- Level up: make a command call the AI — build `/roast`, which injects a name into the prompt.
- Argument parsing: how `/model main` works, and how to read words after the slash command.
- Code review circle: each student reads another student's handler aloud and explains it.

### Week 1 — Day 4: Memory and State

Topics and activities:
- What is Redis? Key-value store explained with the locker analogy — user ID is the locker number, the value is what is inside.
- Upstash: sign up at upstash.com, create a free Redis database, copy the REST URL and token into `.env`.
- Restart the bot — conversation history now survives reboots.
- Live-code `/remember` and `/recall` together: store a note in Redis, retrieve it later.
- Solo build: full notes feature — `/remember <text>`, `/recall` to list all, `/forget` to clear.
- Tavily: sign up at tavily.com, create a free API key (1,000 searches/month), add to `.env`.
- Watch the bot cite sources in its replies after adding the Tavily key.
- Debug challenge: the instructor silently breaks something — students find the bug using print statements.

### Week 1 — Day 5: Deploy and Ship

Topics and activities:
- What is serverless? Explained with the "kitchen that only turns on when someone orders" analogy.
- Walk through `vercel.json` and `api/index.py` — why the webhook route exists, and why `threaded=False` matters.
- Vercel: sign up at vercel.com, connect the GitHub account, install the Vercel CLI (`npm i -g vercel`).
- Run `vercel --prod`, set environment variables in the Vercel dashboard, and register the Telegram webhook via `curl`.
- Verify production: hit `/api/health`, message the live bot, and read the function logs.
- Final project: each student builds one original feature — translator, quiz, mood reader, summarizer, etc.
- Demo day: everyone tests each other's live bots — the same bot from Day 1, now on the internet.
- Preview of Week 2: the AI behind the bot — what the model actually is, and how to train one.

---

## Week 2 — Training a Language Model from Scratch

**Goal:** Train a 350M-parameter Armenian language model end-to-end, fine-tune it into a chatbot, deploy it on HuggingFace Spaces, and connect it to the Week 1 Telegram bot.

**Hardware required:** RTX 4090 GPU.

**Repository:** https://github.com/EdikSimonian/armenian-gpt

**Stack used in Week 2:**
- **HuggingFace** — model hub, dataset hosting, Spaces deployment
- **BPE tokenizer** — 16K vocabulary, 8.3B tokens, 16 parallel workers
- **Armenian corpus** — 63 GB clean dataset, 12 sources
- **xlarge model** — 350M parameters
- **Fine-tuning dataset** — 29K Armenian question-and-answer pairs
- **Chat tokens** — `<|user|>`, `<|assistant|>`, `<|end|>`
- **Telegram bot from Week 1** — used as the frontend for the trained model

### Week 2 — Day 1: Setup and Overview

Topics and activities:
- What is a language model, and how does it work?
- Walk through the full pipeline: download → clean → tokenize → train → fine-tune → deploy.
- Clone the Week 2 repo, install dependencies, set up HuggingFace accounts.
- Train a tiny model end-to-end as a demo (~2 minutes).
- Compare tiny model output to the live demo — why the difference matters.

### Week 2 — Day 2: Data and Tokenization

Topics and activities:
- Download the clean Armenian corpus from HuggingFace (63 GB).
- What is in the data: 12 sources, how it was cleaned, why data quality matters.
- How tokenization works: characters vs BPE, and why computers need numbers.
- Run the BPE tokenizer (16K vocabulary, 8.3B tokens, 16 parallel workers).
- Hands-on: encode Armenian words and explore the vocabulary.

### Week 2 — Day 3: Training (Part 1)

Topics and activities:
- Start xlarge training (350M parameters).
- What happens each step: batches, forward pass, loss, backward pass, weight update.
- Key concepts: loss, learning rate, perplexity, checkpoints.
- Compare early checkpoints — watch the model go from gibberish to real Armenian.
- Practice pause and resume (`Ctrl+C`, `--resume_from`).
- Pause training at the end of the day.

### Week 2 — Day 4: Training (Part 2)

Topics and activities:
- Resume training from yesterday's checkpoint.
- Model architecture: embeddings, attention, feed-forward layers, why depth matters.
- Understanding loss curves: overfitting, underfitting, model capacity.
- Temperature and sampling: how the same model can be creative or conservative.
- Training completes — generate text and compare to Day 1's tiny model.

### Week 2 — Day 5: Fine-tuning and Deployment

Topics and activities:
- Why fine-tuning: autocomplete vs question-answering.
- Chat tokens: `<|user|>`, `<|assistant|>`, `<|end|>`.
- Run fine-tuning on 29K Armenian Q&A pairs (~1 hour).
- Test the chatbot locally.
- Upload the model to HuggingFace and deploy it as a Space.
- Connect the Space to the Telegram bot from Week 1.
- Demo day: everyone tests each other's bots.

---

## Frequently Asked Questions

**Q: How long is the workshop?**
A: Two weeks total, 10 sessions (5 sessions per week).

**Q: Where is the workshop held?**
A: In Armenia — Week 1 runs in both Gyumri and Yerevan (identical content). Week 2 runs only in Yerevan.

**Q: Do I need a GPU for Week 1?**
A: No. Any laptop works for Week 1. Week 2 requires an RTX 4090.

**Q: Do I need to pay for any services?**
A: No. Every service used in Week 1 has a free tier: Cerebras (no credit card), Upstash Redis (free), Tavily (1,000 searches/month free), Vercel (free hobby plan), Telegram (free), GitHub (free).

**Q: What programming language is used?**
A: Python for the bot (Flask) and Python for model training. A small amount of JSON config for Vercel.

**Q: Which AI models are used in Week 1?**
A: `llama3.1-8b` (fast) and `qwen-3-235b` (smarter), served via Cerebras.

**Q: How big is the model trained in Week 2?**
A: 350 million parameters (referred to as "xlarge" in the repo).

**Q: How big is the training dataset?**
A: 63 GB of clean Armenian text from 12 sources, tokenized into 8.3 billion tokens with a 16K BPE vocabulary.

**Q: How long does fine-tuning take?**
A: About 1 hour on an RTX 4090, using 29,000 Armenian question-and-answer pairs.

**Q: Where is the final Week 2 model deployed?**
A: Uploaded to HuggingFace and deployed as a HuggingFace Space, then connected back to the Telegram bot built in Week 1.

**Q: What gets built by the end of Week 1?**
A: A live, deployed Telegram bot on Vercel with a custom persona, custom slash commands, persistent Redis memory, and Tavily-powered web search.

**Q: What gets built by the end of Week 2?**
A: A from-scratch Armenian language model, fine-tuned into a chatbot, deployed on HuggingFace Spaces, and wired into the Telegram bot from Week 1.

---

## Glossary

- **Webhook** — Telegram sends an HTTP request to your server when a user messages the bot. Used in production.
- **Polling** — Your server repeatedly asks Telegram "any new messages?". Used for local development.
- **System prompt** — The instruction given to an LLM that defines its persona and behavior. Lives in `SYSTEM_PROMPT` in `config.py`.
- **Serverless** — Code that only runs when a request arrives. Used on Vercel. Analogy: a kitchen that only turns on when someone orders.
- **Redis** — In-memory key-value store used for persistent chat history and notes. Provided by Upstash.
- **BPE (Byte Pair Encoding)** — Tokenization algorithm that splits text into subword units. Used with a 16K vocabulary in Week 2.
- **Checkpoint** — A saved snapshot of model weights during training. Lets you pause and resume.
- **Perplexity** — A metric for how well a language model predicts text. Lower is better.
- **Fine-tuning** — Taking a pretrained language model and training it further on task-specific data (e.g., Q&A pairs) to change its behavior from autocomplete to chat.
- **Temperature** — A sampling parameter that controls randomness. Low = conservative, high = creative.
- **HuggingFace Space** — A hosted app on HuggingFace that serves a model via a web interface or API.
