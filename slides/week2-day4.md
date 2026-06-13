---
marp: true
size: 16:9
paginate: true
backgroundImage: url('img/bg.png')
footer: 'Week 2 · Day 4 · Training, Part 2'
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
## Week 2, Day 4: Training, Part 2

**Edik Simonian, Summer 2026**

---

## Morning check-in

- How many steps did it cover overnight?
- Loss: where did it start yesterday, where is it now?
- Generate from the latest checkpoint: read it out loud
- Compare with yesterday's step-1000 sample

*It studied while you slept. Let's see the homework.*

---

## What's inside the box

- **Embeddings**: every token becomes a vector (a point in meaning-space)
- **Attention**: each word looks back: *"which earlier words matter to me?"*
- **Feed-forward layers**: where pattern-knowledge is stored
- ×24 layers deep: each layer refines the previous one's understanding
- 350M parameters = all the numbers in those layers, learned from data

---

## Reading the loss curve

- **Healthy**: falls fast, then keeps grinding down slowly
- **Underfitting**: flat and high, model too small for the data
- **Overfitting**: training loss falls, *validation* loss rises, memorizing not learning
- Our setup: 350M params vs 8.3B tokens, plenty of data per parameter

The curve is the model's EKG. Learn to read it.

---

## Temperature: one model, many personalities

```bash
python 5_generate.py --prompt "Երևանը" --temperature 0.3
python 5_generate.py --prompt "Երևանը" --temperature 1.0
```

- **Low**: confident, repetitive, safe
- **High**: creative, surprising, occasionally unhinged
- Same weights. Only the *sampling* changed.

Find your model's sweet spot; it's usually ~0.6–0.8.

---

## Measure, don't vibe

Two scorecards in the repo:

- **`eval_bpb.py`**: bits-per-byte on held-out text, how well does it predict Armenian it has *never seen*?
- **`eval_armbench.py`**: Armenian multiple-choice questions, does it *know* things?

Score an early checkpoint vs. the final one. Numbers, not impressions: that's how you know a change helped.

---

## The finish line

- Training completes → `checkpoints/final.pt`
- Generate with the final model, then with Day 1's tiny model
- Same prompt, side by side. Read both aloud.
- **That gap is what 8 hours and 350M parameters buy.**

---

## Today → Tomorrow

Today: a trained Armenian base model that continues any text you give it.

**Tomorrow:** it learns to *answer* instead of just continue, then we ship it and wire it into your Week 1 bot.
