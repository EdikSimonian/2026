---
marp: true
size: 16:9
paginate: true
backgroundImage: url('img/bg.png')
footer: 'Week 1 · Day 4 · Deploy'
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
## Week 1, Day 4: Deploy

**Edik Simonian, Summer 2026**

---

## Yesterday → today

Your bot has a persona, commands that **think**, and a **memory** that survives restarts.

One thing is still missing: it only runs **while your laptop is on**. Today it leaves your machine and goes **live on the internet**.

---

## Production touches already in the repo

- **Rate limit**: `RATE_LIMIT` env var, default 250 messages/user/day
- **History trimming**: last 20 messages per user, 30-day expiry
- **Whitelist**: `ALLOWED_USERS` makes the bot **silent** to strangers
  *(silence, not rejection: scanners learn nothing)*
- **Dedupe**: Telegram retries webhooks; the bot won't answer twice

All built on the same store you set up yesterday.

---

## From polling to webhook

- All week: **polling**, your computer asks Telegram for updates
- Production: **webhook**, Telegram pushes to your server's URL
- PythonAnywhere runs the **same Flask app** as an always-on worker
- Same code, same `.env` idea: different delivery

Now your bot **stops needing your laptop**.

---

## The front door: `api/index.py`

| Route | Job |
|---|---|
| `/api/health` | "Is the worker alive?" → `OK` |
| `/api/webhook` | Where Telegram delivers messages |
| `/api/deploy` | Pulls new code on push (we'll wire this up) |

- The webhook checks a **secret token**: forged requests get 403. The bot generates and registers it itself on first boot.
- `threaded=False` in `bot/clients.py`: handlers must finish in the request, or the platform may kill them mid-reply.

---

## Deploy: one command

1. Sign up at **pythonanywhere.com** (free Beginner tier)
2. Create an API token: *Account → API token*
3. Add to your local `.env`:

```
PA_USERNAME=<your PA username>
PA_API_TOKEN=<the token>
```

4. Ship it:

```bash
make deploy-pa
```

It creates the web app and a bash console, then **pauses once** for a browser click (next slide).

---

## The one pause: open the console

`make deploy-pa` is hands-off **except once**. It creates your web app, opens a **bash console** on PA, and stops:

```
!!! ONE-TIME MANUAL STEP !!!
Open this URL, wait for the shell prompt, then come back:
https://www.pythonanywhere.com/user/<you>/consoles/<id>/
```

- PA won't run commands on a console until it's been **opened once** in the browser
- Open the URL → wait for the `$` prompt → press **Enter** back in your terminal
- The script takes over: clone repo → venv → install deps → configure → reload

---

## What just happened

The script created the web app, cloned **your fork**, built the venv, uploaded a production `.env`, including:

```
SQLITE_PATH=/home/<you>/bot.db
WEBHOOK_URL=https://<you>.pythonanywhere.com/api/webhook
```

`WEBHOOK_URL` = auto-registration: every boot, the bot tells Telegram *"deliver here."* No manual `curl` needed.

---

## Verify like an engineer

1. `https://<you>.pythonanywhere.com/api/health` → `OK`
2. Message your bot: the reply now comes from the server
3. **Quit the bot on your computer (`Ctrl+C`). Message it again.** 🎉
4. Something wrong? *Web tab → error log*: read the traceback

---

## Push-to-deploy

One-time setup on your fork, in *Settings → Secrets → Actions*:

| Secret | Value |
|---|---|
| `DEPLOY_SECRET` | random string (also in PA `.env`) |
| `PA_DEPLOY_URL` | `https://<you>.pythonanywhere.com/api/deploy` |

Then:

```bash
git commit -am "New personality" && git push
```

**~3 seconds later the live bot is updated.** This is how real teams ship.

---

## The fine print ⚠️

- PA free tier: click the **"Run until 3 months from today"** renewal button **every 3 months**, or the app auto-disables
- PA emails you a week before. Set a phone reminder anyway.
- Free tier limits outbound internet to a whitelist: Telegram and Cerebras are on it

---

## Today → Tomorrow

Today: your bot is **live on the internet**, updating itself on every push.

**Tomorrow:** the whole day is yours. You design and ship your **own** bot, start to finish.
