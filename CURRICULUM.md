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

**Goal:** Ship a live, personalized Telegram bot backed by an LLM, deployed on PythonAnywhere, with persistent SQLite memory, a passing test suite, and push-to-deploy from GitHub.

**Hardware required:** Any computer (no GPU needed).

**Repository:** https://github.com/EdikSimonian/telegram-vercel-bot

> The repo name says "vercel" for historical reasons — the template is now **PythonAnywhere-only** (Vercel, Upstash Redis, and Tavily were dropped from the codebase). Everything below matches the current repo.

**Stack used in Week 1:**
- **Telegram Bot API** — messaging interface (via pyTelegramBotAPI)
- **Flask** (Python) — webhook handler
- **Cerebras** — LLM inference provider (free tier, no credit card; default model `gpt-oss-120b`)
- **SQLite** — persistent key-value memory on disk (no external service, no signup)
- **PythonAnywhere** — free hosting, an always-on WSGI worker
- **GitHub** — source control, CI tests on every push, and push-to-deploy

### Week 1 — Day 1: Setup and First Message

Topics and activities:
- What is a bot? How webhooks work vs polling — the two ways Telegram talks to your code.
- Walkthrough of the full stack: Telegram → Flask → Cerebras → reply (polling locally, webhook in production).
- GitHub: create an account, **fork** the Week 1 repo (the fork is what auto-deploys on Day 4), clone it, run `make install`.
- Telegram: create an account if needed, then message `@BotFather` to create a bot and get the bot token.
- Cerebras: sign up at cloud.cerebras.ai, create a free API key (no credit card required). *Instructor option: skip signups entirely by handing out pre-made keys to a gateway — the bot accepts any OpenAI-compatible endpoint via `AI_BASE_URL`.*
- `cp .env.example .env`, then fill in `TELEGRAM_BOT_TOKEN` and `AI_API_KEY`.
- Run `make run` — the bot starts in polling mode (the "stateless mode" notice is expected for now). Send the first message and see the exchange logged in the terminal.
- Run `make test` — the suite passes offline; it's the same suite GitHub Actions runs on every push to the fork.
- First code edit: change the `/start` message in `bot/handlers.py` to something personal.

### Week 1 — Day 2: Personality and Prompts

Topics and activities:
- What is a system prompt, and why it is the most powerful single line in the project.
- Live experiment: change `SYSTEM_PROMPT` in `bot/config.py`, restart, and watch the bot transform.
- Build a themed bot — students pick their own persona: chef, tutor, game master, comedian, etc.
- Model comparison: set `AI_MODEL` in `.env` and swap between `gpt-oss-120b` (default) and `zai-glm-4.7`. The Cerebras free lineup rotates — the instructor confirms the current options with `GET /v1/models` before the session.
- Pair demo: students chat with each other's personas and give feedback.
- Update `/help` and `/about` commands to match the new bot identity.
- Meet Claude Code — install the terminal AI pair-programmer and point it at the workshop gateway (each student's key is handed out in class). Put it to work on the day's edits (e.g., rewriting `/about` in the bot's voice) while reading and being able to explain every line it writes. It is set up here so Days 3–5 can build with it.

### Week 1 — Day 3: New Commands

Topics and activities:
- How Python decorators work — just enough to understand `@bot.message_handler`.
- Tour of the built-in commands: `/start`, `/help`, `/reset`, `/about` — what `/reset` clears is a preview of Day 4.
- Live-code a `/joke` command together: write the handler, update `/help`, and test it.
- Solo build: each student picks one command to implement — `/quote`, `/fact`, `/roll`, or `/flip`.
- Level up: make a command call the AI — build `/roast <name>`, which injects a name into the prompt. Argument parsing: how to read the words after a slash command. (Read the repo's `/model` handler as reference — it only registers once a second provider is configured, which happens in Week 2.)
- Write a test for the new command in `tests/` and watch `make test` — and CI on the fork — go green.
- Code review circle: each student reads another student's handler aloud and explains it.

### Week 1 — Day 4: Memory and Deploy

The condensed learning day: memory in the first half, deployment in the second, so that by the end of Day 4 students have a stateful bot live on the internet. (Day 5 is then a free build day.)

Topics and activities:
- What is a key-value store? Explained with the locker analogy — user ID is the locker number, the value is what is inside.
- Turn on persistence: set `SQLITE_PATH` in `.env`. No signup, no external service — the database file is created on first use.
- Restart the bot — conversation history now survives reboots. Unset `SQLITE_PATH` to watch the bot degrade gracefully back to stateless mode.
- How the bot remembers conversations: the model is stateless, so on every message `bot/ai.py` loads the chat history from the store, replays the whole conversation to the model, then saves the updated list back (keyed by `chat:{user_id}`, trimmed to the last 20 messages).
- Live-code `/remember` and `/recall` together: store a note through the bot's store, retrieve it later.
- Solo build: full notes feature — `/remember <text>`, `/recall` to list all, `/forget` to clear.
- Production touches already in the repo: per-user rate limiting (`RATE_LIMIT`, 250 messages/day default), history trimming (`MAX_HISTORY`, 30-day expiry), the `ALLOWED_USERS` whitelist (and why it answers strangers with silence instead of a rejection), and webhook deduplication.
- Deploy to production — polling vs webhook for real this time: locally the bot asks Telegram for updates; in production Telegram pushes to our URL. PythonAnywhere runs the same Flask app as an always-on WSGI worker.
- Walk through `api/index.py` — the `/api/health`, `/api/webhook`, and `/api/deploy` routes, how the webhook is protected by an auto-generated secret, and why `threaded=False` matters.
- PythonAnywhere: sign up (free tier), create an API token, then deploy with one command: `make deploy-pa`. Webhook registration is automatic — with `WEBHOOK_URL` set, the bot registers itself with Telegram on every boot.
- Verify production: hit `/api/health`, message the live bot, quit the local bot, and confirm replies still come from the server.
- Push-to-deploy: add the two GitHub Actions secrets, then `git push` updates the live bot in about 3 seconds. The fine print: PA free-tier apps need a monthly "renew" click or they auto-disable — set a reminder.

### Week 1 — Day 5: Build Your Own Bot

A full build day: no new theory — students apply everything from Days 1–4 to design, build, and ship their own bot.

Topics and activities:
- Framing: Days 1–4 covered replies, personality, commands, memory, and deployment. Today each student designs and ships their own bot, start to finish.
- Pick an idea: translator (Armenian ↔ English), quiz master (asks, scores, keeps streaks using the store), mood reader, summarizer, or an original idea.
- Plan first: in three lines, name the command(s), decide whether it calls the AI (`ask_ai`), and whether it needs memory (the store).
- Build it with the all-week recipe — handler → `/help` entry → test → restart — using Claude Code as an assistant while reading and being able to explain every line.
- Ship it live: `git push` updates the deployed bot via push-to-deploy (or `make deploy-pa`). The feature must be live on the deployed bot by demo time.
- Demo day: post bot usernames, everyone tries each other's bots and finds the feature, and the room votes (funniest persona, most useful feature, best surprise).
- Preview of Week 2: the AI behind the bot — what the model actually is, and how to train one.

---

## Week 2 — Training a Language Model from Scratch

**Goal:** Train a 350M-parameter Armenian language model end-to-end, fine-tune it into a chatbot, deploy it on HuggingFace, and connect it to the Week 1 Telegram bot.

**Hardware required:** RTX 4090 GPU (machines stay on overnight between Day 3 and Day 4).

**Repository:** https://github.com/EdikSimonian/armenian-gpt

**Stack used in Week 2:**
- **HuggingFace** — model hub, dataset hosting, Spaces deployment
- **BPE tokenizer** — 16K vocabulary in the published pre-tokenized bins (~8.3B tokens); the repo's v2 pipeline defaults to 32K if you tokenize from scratch. Encoding parallelized across 16 workers.
- **Armenian corpus** — 63 GB clean dataset, 12 sources, hosted as a **private** HuggingFace dataset (read access required)
- **xlarge model** — 350M parameters, ~36K steps, ~8 hours on the RTX 4090
- **Fine-tuning dataset** — ~29K raw Armenian question-and-answer pairs, quality-filtered to ~17K for training
- **Chat tokens** — `<|user|>`, `<|assistant|>`, `<|end|>`
- **Telegram bot from Week 1** — used as the frontend for the trained model (via its second-provider slot)

### Week 2 — Day 1: Setup and Overview

Topics and activities:
- What is a language model, and how does it work?
- Walk through the full pipeline: download → clean → tokenize → train → fine-tune → deploy.
- Clone the Week 2 repo, install dependencies, set up HuggingFace accounts. The corpus is a private HF dataset — the instructor grants each account read access (or distributes a shared read token), and everyone sets `HF_TOKEN`.
- Train a tiny model end-to-end as a demo (~2 minutes, using the pre-tokenized data already staged on the machines).
- Compare tiny model output to the live demo Space — why the difference matters.

### Week 2 — Day 2: Data and Tokenization

Topics and activities:
- What is in the data: 12 sources, how it was cleaned and near-deduplicated, why data quality matters.
- How tokenization works: characters vs BPE, and why computers need numbers.
- Hands-on: train a BPE tokenizer on a small text sample, then encode Armenian words and explore the real tokenizer's vocabulary.
- For the real run, download the pre-tokenized corpus (`python 1_download.py --tokenized-only`, ~10 GB) — re-tokenizing all 63 GB takes hours, and 63 GB per student would saturate the venue network.
- The full reproduce-it-at-home path (63 GB corpus download, cleaning, 16-worker tokenization) is documented in the repo.

### Week 2 — Day 3: Training (Part 1)

Topics and activities:
- Start xlarge training (350M parameters, ~36K steps, ~8 hours on the RTX 4090).
- What happens each step: batches, forward pass, loss, backward pass, weight update.
- Key concepts: loss, learning rate, perplexity, checkpoints (saved every 1000 steps).
- Compare early checkpoints — watch the model go from gibberish to real Armenian.
- Practice pause and resume: `Ctrl+C` saves a checkpoint on the way out, `--resume_from` continues exactly where it left off — same step, same learning-rate schedule.
- Leave training running overnight — it will not finish within class hours. (Fallback if the machines can't stay on: train `large` — 85M parameters, ~3 hours — and finish the same day.)

### Week 2 — Day 4: Training (Part 2)

Topics and activities:
- Check the overnight run: how far did it get, what does the loss curve look like, what do the latest samples read like.
- Model architecture: embeddings, attention, feed-forward layers, why depth matters.
- Understanding loss curves: overfitting, underfitting, model capacity.
- Temperature and sampling: how the same model can be creative or conservative.
- Measure, don't vibe: score checkpoints with `eval_bpb.py` (bits-per-byte) and `eval_armbench.py` (Armenian multiple-choice accuracy).
- Training completes — generate text with `5_generate.py` and compare to Day 1's tiny model.

### Week 2 — Day 5: Fine-tuning and Deployment

Topics and activities:
- Why fine-tuning: autocomplete vs question-answering.
- Chat tokens: `<|user|>`, `<|assistant|>`, `<|end|>`.
- Run fine-tuning on the quality-filtered Armenian Q&A set (~17K pairs from ~29K raw) — a few hundred steps, well under an hour; `chat_best.pt` keeps the checkpoint with the best validation loss.
- Test the chatbot locally with `8_chat.py`.
- Upload the model to HuggingFace (`python 7_deploy.py --repo <username>/armgpt`) and deploy the Gradio demo Space.
- Connect the model to the Week 1 Telegram bot: the bot has a second-provider slot — set `ARMGPT_BASE_URL` to any OpenAI-compatible endpoint and switch with `/model armgpt`. The HF Space is the public demo UI; the bot needs the OpenAI-compatible endpoint (the reference deployment runs on Modal). Teaching moment: the provider sends only the latest message — no system prompt, no memory — sized for a small self-trained model.
- Demo day: everyone tests each other's bots, running locally via `make run` (PythonAnywhere's free-tier outbound whitelist blocks the model endpoint, so the finale runs on the local machines).

---

## Instructor Pre-Workshop Checklist

- Verify the Cerebras free-tier model lineup (`GET /v1/models`) and update Day 2's model names if the lineup rotated.
- Decide the Week 1 key strategy: individual Cerebras signups, or pre-made gateway keys handed out on Day 1 (any OpenAI-compatible endpoint works via `AI_BASE_URL`).
- Grant each student's HuggingFace account read access to the private corpus dataset, or prepare a shared read token.
- Pre-stage the pre-tokenized corpus (~10 GB, `python 1_download.py --tokenized-only`) on every GPU machine — this also enables Day 1's two-minute tiny-model demo.
- Confirm the GPU machines can run unattended overnight between Day 3 and Day 4; otherwise plan for the `large` preset.
- Confirm the OpenAI-compatible model endpoint for the Week 2 finale is up, and that demo-day bots will run locally (PythonAnywhere free tier cannot reach it).
- After the workshop, remind students: PythonAnywhere free apps need a monthly renewal click or they auto-disable.

---

## Frequently Asked Questions

**Q: How long is the workshop?**
A: Two weeks total, 10 sessions (5 sessions per week).

**Q: Where is the workshop held?**
A: In Armenia — Week 1 runs in both Gyumri and Yerevan (identical content). Week 2 runs only in Yerevan.

**Q: Do I need a GPU for Week 1?**
A: No. Any computer works for Week 1. Week 2 requires an RTX 4090.

**Q: Do I need to pay for any services?**
A: No. Every service used has a free tier: Cerebras (1M tokens/day, 30 requests/min, no credit card), PythonAnywhere (free Beginner tier — needs a monthly renewal click), Telegram (free), GitHub (free), HuggingFace (free).

**Q: Are there age requirements for the services?**
A: The services used are generally 13+ (16+ in the EU/UK for some, due to GDPR). Younger students do the signups together with a parent or teacher, who creates the accounts and shares the keys — all of the coding, testing, and deployment is still done by the student.

**Q: What programming language is used?**
A: Python for the bot (Flask) and Python for model training, plus a Makefile and one GitHub Actions workflow. No JavaScript or Node required.

**Q: Which AI models are used in Week 1?**
A: `gpt-oss-120b` (default) and `zai-glm-4.7`, served via Cerebras. The free lineup rotates, so the instructor confirms the current options before each session.

**Q: How big is the model trained in Week 2?**
A: 350 million parameters (referred to as "xlarge" in the repo) — about 8 hours of training on the workshop's RTX 4090.

**Q: How big is the training dataset?**
A: 63 GB of clean Armenian text from 12 sources, tokenized into ~8.3 billion tokens (16K-vocabulary BPE in the published bins; the repo's v2 pipeline defaults to a 32K vocabulary).

**Q: How long does fine-tuning take?**
A: Well under an hour on the RTX 4090 — a few hundred steps over ~17K quality-filtered question-and-answer pairs (from ~29K raw).

**Q: Where is the final Week 2 model deployed?**
A: Uploaded to HuggingFace and deployed as a HuggingFace Space (the public demo UI), and served through an OpenAI-compatible endpoint that the Week 1 Telegram bot connects to via its second-provider slot.

**Q: What gets built by the end of Week 1?**
A: A live Telegram bot on PythonAnywhere with a custom persona, custom slash commands, persistent SQLite memory, rate limiting, a passing test suite, and push-to-deploy from GitHub.

**Q: What gets built by the end of Week 2?**
A: A from-scratch Armenian language model, fine-tuned into a chatbot, deployed on HuggingFace, and wired into the Telegram bot from Week 1.

---

## Glossary

- **Webhook** — Telegram sends an HTTP request to your server when a user messages the bot. Used in production.
- **Polling** — Your server repeatedly asks Telegram "any new messages?". Used for local development.
- **System prompt** — The instruction given to an LLM that defines its persona and behavior. Lives in `SYSTEM_PROMPT` in `bot/config.py`.
- **WSGI worker** — The always-on Python process that hosts the Flask app on PythonAnywhere. Telegram's webhook requests land on it.
- **SQLite** — A file-based database the bot uses as a key-value store (with expiry) for chat history, notes, rate limits, and dedupe. No external service needed.
- **BPE (Byte Pair Encoding)** — Tokenization algorithm that splits text into subword units. Week 2 uses a 16K vocabulary (the repo's v2 pipeline defaults to 32K).
- **Checkpoint** — A saved snapshot of model weights during training. Lets you pause and resume.
- **Perplexity** — A metric for how well a language model predicts text. Lower is better.
- **Base model** — A model trained only to continue text (autocomplete). It has no chat format and no memory until it is fine-tuned.
- **Fine-tuning** — Taking a pretrained language model and training it further on task-specific data (e.g., Q&A pairs) to change its behavior from autocomplete to chat.
- **Temperature** — A sampling parameter that controls randomness. Low = conservative, high = creative.
- **HuggingFace Space** — A hosted app on HuggingFace that serves a model via a web interface or API.
