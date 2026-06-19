---
marp: true
size: 16:9
paginate: true
backgroundImage: url('img/bg.png')
footer: 'Week 2 · Day 2 · Data and Tokenization'
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
## Week 2, Day 2: Data and Tokenization

**Edik Simonian, Summer 2026**

---

## 63 GB of Armenian: from where?

**12 sources**, one cleaned corpus:

- Wikipedia · Wikisource · Wiktionary · Wikiquote
- CC-100 · HPLT 3.0 · CC-News · CulturaX · mC4 · Glot500
- ARLIS · FineTranslations

Encyclopedias, news, books, the open web: the model will only ever know what's in here.

---

## Garbage in, garbage out

Before training, the corpus was:

- **Cleaned**: boilerplate, menus, broken encoding stripped out
- **Deduplicated**: exact copies *and* near-copies (web text repeats a lot)
- **Prioritized**: high-quality sources first when there's overlap

A model trained on raw internet learns raw internet. Data work is unglamorous and decisive.

---

## Why tokens? Computers eat numbers

- A model can't read "Բարև"; it needs numbers
- **Character-level**: tiny vocabulary, but every word becomes a long sequence
- **BPE (Byte Pair Encoding)**: merge frequent pairs into subword pieces
  - `Հայաստան` → `Հայ` + `աստան` *(illustrative)*
  - Common words = 1 token, rare words = a few pieces
- Our corpus → **~8.3 billion BPE tokens**, 16K-piece vocabulary

<!-- The repo's v2 pipeline defaults to a 32K vocab if you re-tokenize from scratch; the published pre-tokenized bins are 16K. -->

---

## Hands-on: think like a tokenizer

1. Train a BPE tokenizer on a small sample file *(instructor-led)*
2. Encode your name. Encode «Երևան». Encode a rare word.
3. Which words survive as one piece? Which shatter?
4. What happens to English words in an Armenian tokenizer?

The vocabulary is a mirror of the training data.

---

## Getting the real data, the smart way

```bash
python 1_download.py --tokenized-only     # ~10 GB
```

- Pre-tokenized `train_bpe.bin` + `val_bpe.bin` + tokenizer: ready to train
- Re-tokenizing 63 GB yourself: **hours** (even with 16 parallel workers)
- 63 GB × everyone in this room: the venue wifi votes no
- The full from-scratch path is in the repo README: reproduce it at home

<!-- Data is already pre-staged on the GPU machines; this command is the "how it got there". -->

---

## Today → Tomorrow

Today: the corpus, the cleaning, and how text becomes numbers.

**Tomorrow morning we press the button.** 350M parameters start learning Armenian, and keep learning while we sleep.
