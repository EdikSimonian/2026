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
## Week 2 — Day 3: Training, Part 1

**Edik Simonian**

---

## Press the button

```bash
python 4_train.py --preset xlarge --tokenizer bpe
```

- **350M parameters · 36K steps · ~8 hours on this GPU**
- It will *not* finish during class — that's by design
- First milestone: watch the loss start falling

We start it **now**, then learn what it's doing while it does it.

---

## One training step, slow motion

1. **Batch** — grab a chunk of tokenized text
2. **Forward pass** — model predicts every next token
3. **Loss** — how wrong were the predictions? One number.
4. **Backward pass** — trace every weight's share of the blame
5. **Update** — nudge all 350M weights a tiny step downhill

Repeat 36,000 times. That's the whole secret.

---

## Words you'll see scroll by

- **Loss** — wrongness. Down = learning.
- **Learning rate** — step size downhill. Too big: chaos. Too small: forever.
- **Perplexity** — "how many tokens was the model torn between?" Lower is better.
- **Checkpoint** — full snapshot of the weights, saved **every 1000 steps**

---

## Watch a model grow up

Generate from checkpoints as they appear:

- step 1000 — character soup
- step 5000 — Armenian-shaped words
- step 20000 — grammar emerges
- step 36000 — fluent continuation *(tomorrow)*

Keep your favorite "baby pictures" — compare on Friday.

---

## Pause and resume — practice now

```bash
# Ctrl+C  →  saves a checkpoint on the way out

python 4_train.py --preset xlarge --tokenizer bpe \
    --resume_from checkpoints/step_5000.pt
```

- Checkpoint = weights + optimizer + step counter + schedule
- Resume continues **exactly** where it stopped — nothing lost
- This is your insurance against power cuts, crashes, and impatience

---

## Tonight

- Machines **stay on, training** — do not shut down 🌙
- ~8 hours of GPU time happens while you sleep
- Tomorrow morning: a model that's been studying all night

<!--
If the room can't run overnight: switch to --preset large (85M, ~3 hrs)
and finish same-day. Decide before students leave.
-->

---

## Today → Tomorrow

Today: training started, and you can read its vital signs.

**Tomorrow:** what's actually inside — attention, layers, loss curves — and your model's first real report card.
