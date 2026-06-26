---
marp: true
size: 16:9
paginate: true
backgroundImage: url('img/bg.png')
footer: 'Week 1 · Day 5 · Build Your Own Bot'
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
## Week 1, Day 5: Build Your Own Bot

**Edik Simonian, Summer 2026**

---

## First: fix your git identity

Swapped seats? This machine may still be signed in as **yesterday's student** — so your pushes fail, or commits land under the wrong name.

```bash
brew install gh       # GitHub CLI — once per machine
gh auth logout        # drop the previous student's login
gh auth login         # GitHub.com → HTTPS → Login with a web browser
gh auth setup-git     # make git push as YOU
```

Then tell git who you are (run inside your bot folder):

```bash
git config user.name  "Your Name"
git config user.email "the-email-on-your-github"
```

*"Login with a web browser" works even if you sign in to GitHub with Google — it's still GitHub's OAuth.*

---

## Today: you're the engineer

Four days, four superpowers:

- **Day 1**: a bot that replies   ·   **Day 2**: a personality
- **Day 3**: commands that think, and memory   ·   **Day 4**: live on the internet

No new theory today. You **design and ship your own bot**, start to finish.

*Same repo, same skills. The idea is yours.*

---

## Pick your idea

Choose one, or invent your own:

- 🌍 **Translator**: Armenian ↔ English on demand
- ❓ **Quiz master**: asks, scores, keeps streaks *(you have a store!)*
- 🎭 **Mood reader**: guesses the mood of a message
- 📝 **Summarizer**: paste a wall of text, get three lines

It must be **live on your deployed bot** by demo time.

---

## Plan before you code

Before touching the keyboard, write **three lines**:

1. **The command(s)**: what does the user type? `/quiz`, `/translate <text>`...
2. **Does it think?** A static reply, or does it call the AI (`ask_ai`)?
3. **Does it remember?** One-shot, or does it use the store (`note:{id}` pattern)?

A feature you can describe in three lines, you can build.

---

## Build it: you lead, Claude Code assists

Same recipe as all week: **handler → `/help` entry → test → restart**.

- Ask Claude Code in plain English; it edits `bot/handlers.py` and can run the bot
- **Read every line.** Can't explain it? Ask it to explain, or undo it
- Add a test in `tests/`; `make test` **green** before you ship

> You're the engineer. Claude Code is the assistant. You explain your code at demo.

---

## Ship it live

You deployed yesterday, so today it's one step:

```bash
git commit -am "Add my feature" && git push
```

**~3 seconds later your live bot has the feature.** Push-to-deploy does the rest.

- No push-to-deploy set up? `make deploy-pa` still works
- Verify on your **live** bot, feature working, before demo

---

## Demo day

1. Post your bot's username for the room
2. Try everyone's bot, find their feature
3. Vote: funniest persona, most useful feature, best surprise

**Same bot you started on Day 1, now it's yours, and it lives on the internet.**

---

## Next week

Your bot's brain is someone else's model behind an API.

**Week 2: we train our own.** 63 GB of Armenian text, one GPU, a 350-million-parameter model, built from scratch, fine-tuned to chat, and plugged into *this* bot.
