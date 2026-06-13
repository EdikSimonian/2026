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
## Week 2 — Day 2: Data and Tokenization

**Edik Simonian**

---

## 63 GB of Armenian — from where?

**12 sources**, one cleaned corpus:

- Wikipedia · Wikisource · Wiktionary · Wikiquote
- CC-100 · HPLT 3.0 · CC-News · CulturaX · mC4 · Glot500
- ARLIS · FineTranslations

Encyclopedias, news, books, the open web — the model will only ever know what's in here.

---

## Garbage in, garbage out

Before training, the corpus was:

- **Cleaned** — boilerplate, menus, broken encoding stripped out
- **Deduplicated** — exact copies *and* near-copies (web text repeats a lot)
- **Prioritized** — high-quality sources first when there's overlap

A model trained on raw internet learns raw internet. Data work is unglamorous and decisive.

---

## Why tokens? Computers eat numbers

- A model can't read "Բարև" — it needs numbers
- **Character-level**: tiny vocabulary, but every word becomes a long sequence
- **BPE (Byte Pair Encoding)**: merge frequent pairs into subword pieces
  - `Հայաստան` → `Հայ` + `աստան` *(illustrative)*
  - Common words = 1 token, rare words = a few pieces
- Our corpus → **~8.3 billion BPE tokens**, 16K-piece vocabulary

<!-- The repo's v2 pipeline defaults to a 32K vocab if you re-tokenize from scratch — the published pre-tokenized bins are 16K. -->

---

## Hands-on: think like a tokenizer

1. Train a BPE tokenizer on a small sample file *(instructor-led)*
2. Encode your name. Encode «Երևան». Encode a rare word.
3. Which words survive as one piece? Which shatter?
4. What happens to English words in an Armenian tokenizer?

The vocabulary is a mirror of the training data.

---

## Getting the real data — the smart way

```bash
python 1_download.py --tokenized-only     # ~10 GB
```

- Pre-tokenized `train_bpe.bin` + `val_bpe.bin` + tokenizer — ready to train
- Re-tokenizing 63 GB yourself: **hours** (even with 16 parallel workers)
- 63 GB × everyone in this room: the venue wifi votes no
- The full from-scratch path is in the repo README — reproduce it at home

<!-- Data is already pre-staged on the GPU machines; this command is the "how it got there". -->

---

## Today → Tomorrow

Today: the corpus, the cleaning, and how text becomes numbers.

**Tomorrow morning we press the button.** 350M parameters start learning Armenian — and keep learning while we sleep.
