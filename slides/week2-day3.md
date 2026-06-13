---
marp: true
size: 16:9
paginate: true
backgroundImage: url('img/bg.png')
footer: 'Week 2 · Day 3 · Training, Part 1'
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
## Week 2, Day 3: Training, Part 1

**Edik Simonian, Summer 2026**

---

## Press the button

```bash
python 4_train.py --preset xlarge --tokenizer bpe
```

- **350M parameters · 36K steps · ~8 hours on this GPU**
- It will *not* finish during class; that's by design
- First milestone: watch the loss start falling

We start it **now**, then learn what it's doing while it does it.

---

## One training step, slow motion

1. **Batch**: grab a chunk of tokenized text
2. **Forward pass**: model predicts every next token
3. **Loss**: how wrong were the predictions? One number.
4. **Backward pass**: trace every weight's share of the blame
5. **Update**: nudge all 350M weights a tiny step downhill

Repeat 36,000 times. That's the whole secret.

---

## Words you'll see scroll by

- **Loss**: wrongness. Down = learning.
- **Learning rate**: step size downhill. Too big: chaos. Too small: forever.
- **Perplexity**: "how many tokens was the model torn between?" Lower is better.
- **Checkpoint**: full snapshot of the weights, saved **every 1000 steps**

---

## Watch a model grow up

Generate from checkpoints as they appear:

- step 1000: character soup
- step 5000: Armenian-shaped words
- step 20000: grammar emerges
- step 36000: fluent continuation *(tomorrow)*

Keep your favorite "baby pictures" to compare on Friday.

---

## Pause and resume: practice now

```bash
# Ctrl+C  →  saves a checkpoint on the way out

python 4_train.py --preset xlarge --tokenizer bpe \
    --resume_from checkpoints/step_5000.pt
```

- Checkpoint = weights + optimizer + step counter + schedule
- Resume continues **exactly** where it stopped: nothing lost
- This is your insurance against power cuts, crashes, and impatience

---

## Tonight

- Machines **stay on, training**: do not shut down 🌙
- ~8 hours of GPU time happens while you sleep
- Tomorrow morning: a model that's been studying all night

<!--
If the room can't run overnight: switch to --preset large (85M, ~3 hrs)
and finish same-day. Decide before students leave.
-->

---

## Today → Tomorrow

Today: training started, and you can read its vital signs.

**Tomorrow:** what's actually inside (attention, layers, loss curves) and your model's first real report card.
