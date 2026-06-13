---
marp: true
size: 16:9
paginate: true
backgroundImage: url('img/bg.png')
footer: 'Week 2 · Day 1 · Setup and Overview'
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
## Week 2, Day 1: Setup and Overview

**Edik Simonian, Summer 2026**

---

## What you'll build this week

- A **350-million-parameter Armenian language model**
- Trained **from scratch**: no pretrained weights, no shortcuts
- Fine-tuned into a **chatbot**
- Deployed on **HuggingFace**
- Plugged into **your Week 1 Telegram bot**

Last week you rented a brain. This week you grow one.

---

## What *is* a language model?

- A function that answers one question: **"what token comes next?"**
- Trained by reading text and predicting the next word, billions of times
- Wrong guess → adjust the weights a tiny bit → repeat
- Everything else (chat, translation, jokes) falls out of that one skill

GPT, Claude, Llama: same core idea, more zeros in the parameter count.

---

## The pipeline and the repo

```
1_download.py    get the corpus (or pre-tokenized data)
2_prepare.py     clean + dedup                (done for you)
3_tokenize.py    text → numbers (BPE)
4_train.py       pretrain                     (Days 3–4)
5_generate.py    sample text from a checkpoint
6_finetune.py    teach it to chat             (Day 5)
7_deploy.py      upload to HuggingFace        (Day 5)
8_chat.py        talk to your model
```

`github.com/EdikSimonian/armenian-gpt`

---

## Setup

```bash
git clone https://github.com/EdikSimonian/armenian-gpt.git
cd armenian-gpt
pip install numpy sentencepiece huggingface_hub zstandard
pip install torch --index-url https://download.pytorch.org/whl/cu121
```

HuggingFace: create an account, then a **read token**:

```bash
export HF_TOKEN=hf_...
```

<!--
The corpus dataset is PRIVATE; grant each student's HF account read
access beforehand, or distribute a shared read token. Data is already
pre-staged on the GPU machines.
-->

---

## Demo: train a model in 2 minutes

```bash
python 4_train.py --preset tiny --tokenizer bpe
python 5_generate.py --prompt "Հայաստանը"
```

- ~0.2M parameters, 1000 steps, under 2 minutes
- The output is... not great. **That's the point.**

<!-- Uses the pre-tokenized bins already on the machines. -->

---

## Tiny vs. the real thing

Open the live demo: **huggingface.co/spaces/edisimon/armgpt-demo**

Same code. Same data. Same training loop.

| | tiny (just now) | demo model |
|---|---|---|
| Parameters | ~0.2M | ~1B |
| Training | 2 minutes | days |
| Output | word soup | real Armenian |

The *only* differences: *size* and *time*. That's the lesson of the week.

---

## The menu

| Preset | Params | Steps | ~Time (RTX 4090) |
|---|---|---|---|
| `tiny` | 0.2M | 1K | < 1 min |
| `small` | 10M | 5K | ~10 min |
| `medium` | 30M | 10K | ~1 hr |
| `large` | 85M | 20K | ~3 hrs |
| **`xlarge`** | **350M** | **36K** | **~8 hrs** ← ours |
| `giant` | ~1B | 122K | ~48 hrs (not this week) |

---

## Today → Tomorrow

Today: the pipeline end-to-end, and a tiny model that proves it runs.

**Tomorrow:** the fuel. 63 GB of Armenian text: where it came from, and how text becomes numbers.
