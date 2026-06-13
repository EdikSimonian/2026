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
## Week 2 — Day 4: Training, Part 2

**Edik Simonian**

---

## Morning check-in

- How many steps did it cover overnight?
- Loss: where did it start yesterday, where is it now?
- Generate from the latest checkpoint — read it out loud
- Compare with yesterday's step-1000 sample

*It studied while you slept. Let's see the homework.*

---

## What's inside the box

- **Embeddings** — every token becomes a vector (a point in meaning-space)
- **Attention** — each word looks back: *"which earlier words matter to me?"*
- **Feed-forward layers** — where pattern-knowledge is stored
- ×24 layers deep — each layer refines the previous one's understanding
- 350M parameters = all the numbers in those layers, learned from data

---

## Reading the loss curve

- **Healthy** — falls fast, then keeps grinding down slowly
- **Underfitting** — flat and high: model too small for the data
- **Overfitting** — training loss falls, *validation* loss rises: memorizing, not learning
- Our setup: 350M params vs 8.3B tokens — plenty of data per parameter

The curve is the model's EKG. Learn to read it.

---

## Temperature: one model, many personalities

```bash
python 5_generate.py --prompt "Երևանը" --temperature 0.3
python 5_generate.py --prompt "Երևանը" --temperature 1.0
```

- **Low** — confident, repetitive, safe
- **High** — creative, surprising, occasionally unhinged
- Same weights. Only the *sampling* changed.

Find your model's sweet spot — it's usually ~0.6–0.8.

---

## Measure, don't vibe

Two scorecards in the repo:

- **`eval_bpb.py`** — bits-per-byte on held-out text: how well does it predict Armenian it has *never seen*?
- **`eval_armbench.py`** — Armenian multiple-choice questions: does it *know* things?

Score an early checkpoint vs. the final one. Numbers, not impressions — that's how you know a change helped.

---

## The finish line

- Training completes → `checkpoints/final.pt`
- Generate with the final model — then with Day 1's tiny model
- Same prompt, side by side. Read both aloud.
- **That gap is what 8 hours and 350M parameters buy.**

---

## Today → Tomorrow

Today: a trained Armenian base model that continues any text you give it.

**Tomorrow:** it learns to *answer* instead of just continue — then we ship it and wire it into your Week 1 bot.
