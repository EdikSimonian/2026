---
marp: true
size: 16:9
paginate: true
backgroundImage: url('img/bg.png')
footer: 'Week 2 · Day 5 · Fine-tuning and Deployment'
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
## Week 2, Day 5: Fine-tuning and Deployment

**Edik Simonian, Summer 2026**

---

## The problem with a base model

Ask it: *"Ո՞րն է Հայաստանի մայրաքաղաքը"*

It might **continue** with more questions instead of answering, because continuing text is *all it knows*.

- **Base model** = autocomplete
- **Chatbot** = answers when asked

The bridge between them is **fine-tuning**.

---

## Chat tokens: teaching it turns

Wrap every example in special tokens *(format sketch)*:

```
<|user|>Ով է գրել «Գիքորը»։<|end|>
<|assistant|>Հովհաննես Թումանյանը։<|end|>
```

The model learns the *pattern*: after `<|assistant|>` comes **an answer**, and `<|end|>` means stop.

Three new tokens, a whole new behavior.

---

## Run it

```bash
python 1_download.py --download --qa      # Q&A sources
python 2_prepare.py --qa                  # merge + filter
python 3_tokenize.py --qa --tokenizer bpe
python 6_finetune.py --tokenizer bpe      # loads checkpoints/final.pt
```

- ~29K raw Q&A pairs → **~17K** after quality filtering
- A few hundred steps: **well under an hour**
- `chat_best.pt` keeps whichever step had the best validation loss

---

## Talk to it

```bash
python 8_chat.py
```

- Ask it the capital question again: **now it answers**
- Try: a factual question, a creative request, something it can't know
- Be fair: it's 350M parameters, not Claude. Celebrate what works.

---

## Ship it

```bash
python 7_deploy.py --repo <your-username>/armgpt
```

- Uploads weights + tokenizer + model card to HuggingFace
- The Gradio demo Space (like `edisimon/armgpt-demo`) serves it on CPU, a public URL anyone can try
- Your model now has a home on the internet

---

## The full circle: into your Week 1 bot

The bot has a second-provider slot for any **OpenAI-compatible** endpoint:

```
ARMGPT_BASE_URL=https://<your-endpoint>/v1
ARMGPT_API_KEY=<key>
ARMGPT_MODEL=armgpt
```

Restart → a `/model` command appears → `/model armgpt` ⇄ `/model main`

- The provider sends **only your latest message** (no system prompt, no memory), sized for a small self-trained model
- *(The Space is the demo UI; the bot needs the API endpoint, reference setup runs on Modal)*

---

## Demo day: run it locally

```bash
make run        # in your Week 1 bot repo
```

- PythonAnywhere's free tier can't reach the model endpoint (outbound whitelist), so today the bots run locally on your computers
- Try everyone's bot: `/model armgpt`, same question to both brains
- One question, two answers: a 350M model **you trained**, and a frontier model, side by side in *your* bot

---

<!-- _class: cover -->
<!-- _backgroundImage: url('img/title.jpg') -->
<!-- _paginate: false -->
<!-- _footer: '' -->

# Two weeks, full stack

**Week 1**: you shipped a bot to the internet.
**Week 2**: you built the intelligence inside one.

Code → Train → Deploy. You've now done all three.

**Շնորհավորում եմ։** 🎉
