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
## Week 2 — Day 1: Setup and Overview

**Edik Simonian**

---

## What you'll build this week

- A **350-million-parameter Armenian language model**
- Trained **from scratch** — no pretrained weights, no shortcuts
- Fine-tuned into a **chatbot**
- Deployed on **HuggingFace**
- Plugged into **your Week 1 Telegram bot**

Last week you rented a brain. This week you grow one.

---

## What *is* a language model?

- A function that answers one question: **"what token comes next?"**
- Trained by reading text and predicting the next word, billions of times
- Wrong guess → adjust the weights a tiny bit → repeat
- Everything else — chat, translation, jokes — falls out of that one skill

GPT, Claude, Llama: same core idea, more zeros in the parameter count.

---

## The pipeline — and the repo

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
The corpus dataset is PRIVATE — grant each student's HF account read
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

**Tomorrow:** the fuel. 63 GB of Armenian text — where it came from, and how text becomes numbers.
