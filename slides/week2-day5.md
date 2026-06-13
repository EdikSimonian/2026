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
## Week 2 — Day 5: Fine-tuning and Deployment

**Edik Simonian**

---

## The problem with a base model

Ask it: *"Ո՞րն է Հայաստանի մայրաքաղաքը"*

It might **continue** with more questions instead of answering — because continuing text is *all it knows*.

- **Base model** = autocomplete
- **Chatbot** = answers when asked

The bridge between them is **fine-tuning**.

---

## Chat tokens — teaching it turns

Wrap every example in special tokens *(format sketch)*:

```
<|user|>Ով է գրել «Գիքորը»։<|end|>
<|assistant|>Հովհաննես Թումանյանը։<|end|>
```

The model learns the *pattern*: after `<|assistant|>` comes **an answer**, and `<|end|>` means stop.

Three new tokens — a whole new behavior.

---

## Run it

```bash
python 1_download.py --download --qa      # Q&A sources
python 2_prepare.py --qa                  # merge + filter
python 3_tokenize.py --qa --tokenizer bpe
python 6_finetune.py --tokenizer bpe      # loads checkpoints/final.pt
```

- ~29K raw Q&A pairs → **~17K** after quality filtering
- A few hundred steps — **well under an hour**
- `chat_best.pt` keeps whichever step had the best validation loss

---

## Talk to it

```bash
python 8_chat.py
```

- Ask it the capital question again — **now it answers**
- Try: a factual question, a creative request, something it can't know
- Be fair: it's 350M parameters, not Claude. Celebrate what works.

---

## Ship it

```bash
python 7_deploy.py --repo <your-username>/armgpt
```

- Uploads weights + tokenizer + model card to HuggingFace
- The Gradio demo Space (like `edisimon/armgpt-demo`) serves it on CPU — a public URL anyone can try
- Your model now has a home on the internet

---

## The full circle: into your Week 1 bot

The bot has a second-provider slot — any **OpenAI-compatible** endpoint:

```
ARMGPT_BASE_URL=https://<your-endpoint>/v1
ARMGPT_API_KEY=<key>
ARMGPT_MODEL=armgpt
```

Restart → a `/model` command appears → `/model armgpt` ⇄ `/model main`

- The provider sends **only your latest message** — no system prompt, no memory — sized for a small self-trained model
- *(The Space is the demo UI; the bot needs the API endpoint — reference setup runs on Modal)*

---

## Demo day — run it locally

```bash
make run        # in your Week 1 bot repo
```

- PythonAnywhere's free tier can't reach the model endpoint (outbound whitelist) — today the bots run on laptops
- Try everyone's bot: `/model armgpt`, same question to both brains
- One question, two answers: a 350M model **you trained**, and a frontier model — side by side in *your* bot

---

<!-- _backgroundImage: url('img/title.jpg') -->
<!-- _color: white -->
<!-- _paginate: false -->

# Two weeks, full stack

**Week 1** — you shipped a bot to the internet.
**Week 2** — you built the intelligence inside one.

Code → Train → Deploy. You've now done all three.

**Շնորհավորում եմ։** 🎉
