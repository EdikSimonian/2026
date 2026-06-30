---
marp: true
size: 16:9
paginate: true
backgroundImage: url('img/bg.png')
footer: 'Շաբաթ 1 · Օր 5 · Ստեղծիր քո սեփական բոտը (Windows · PowerShell)'
---

<style>
/* --- Workshop theme --- */
section {
  font-size: 27px;
  line-height: 1.45;
  color: #1c2733;
  justify-content: flex-start;
  padding: 64px 78px 84px;
  font-family: -apple-system, "Segoe UI", "Helvetica Neue", "Noto Sans Armenian", Arial, sans-serif;
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
li { margin-bottom: 0.3em; }
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
  margin: 0.25em 0 1em;
  font-size: 21px;
  line-height: 1.45;
  box-shadow: 0 5px 14px rgba(15, 34, 51, 0.14);
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
## Շաբաթ 1, Օր 5․ Ստեղծիր քո սեփական բոտը — Windows

**Edik Simonian, Ամառ 2026**

<!--
NATIVE WINDOWS (Scoop + PowerShell) edition of Day 5, paired with
week1-day1-windows.md. Identical to the Mac/Linux deck (week1-day5.md) except
`make test` -> `.\make.ps1 test` and `make deploy-pa` -> `.\make.ps1 deploy-pa`
(deploy needs PowerShell 7). The git/gh identity-reset commands are the same.
-->

---

## 📢 Ուշադրություն․ վիկտորինաներ

- Վիկտորինաներն այժմ **ավելի դժվար** են
- Պատասխանները **խառնված են ըստ յուրաքանչյուր աշակերտի** — հարևանիդ էկրանը չի օգնի
- Դրանք աշխատում են **Telegram-ի ներսում**, հենց այնտեղ, որտեղ քո բոտն է աշխատում
- **Այսօր երկուսը․** մեկը **դասի սկզբին**, մյուսը **ընդմիջումից անմիջապես հետո**

**Մի՛ ուշացիր** — բաց թողած վիկտորինան այլևս չես կարող հանձնել։

---

## Սկզբում․ ուղղիր քո git ինքնությունը

Տե՞ղդ փոխեցիր։ Այս մեքենան գուցե մուտք գործած լինի **երեկվա աշակերտի** անունով — push-երը ձախողվում են կամ հայտնվում սխալ անունով։ Վերականգնիր այն․

```bash
gh auth logout       # drop the old login (ok if "not logged in")
gh auth login        # GitHub.com → HTTPS → browser (Google OK)
gh auth setup-git    # git pushes as YOU now

git config user.name  "Your Name"
git config user.email "your-github-email"
```

Գործարկիր `git config` տողերը **քո բոտի թղթապանակի ներսում**։

---

## Դեռ "Permission denied (publickey)" է՞

Այդ `git@github.com:`-ը նշանակում է, որ քո repo-ն GitHub-ի հետ խոսում է **SSH**-ով — բայց քո բանալին այս մեքենայի վրա չէ։ Ուղղորդիր այն դեպի **HTTPS**, որ քո `gh` մուտքն օգտագործվի․

```bash
git remote -v        # git@github.com:... = SSH (the problem)
git remote set-url origin https://github.com/<you>/telegram-pythonanywhere-bot.git
git push             # now authenticates with your gh login
```

HTTPS + `gh auth`-ին **SSH բանալի պետք չէ** — հենց այն, ինչ քեզ պետք է ընդհանուր մեքենայի վրա։

---

## Այսօր․ դու ինժեներն ես

Չորս օր, չորս գերկարողություն․

- **Օր 1**․ բոտ, որ պատասխանում է   ·   **Օր 2**․ բնավորություն
- **Օր 3**․ հրամաններ, որ մտածում են, և հիշողություն   ·   **Օր 4**․ կենդանի՝ համացանցում

Այսօր նոր տեսություն չկա։ Դու **նախագծում և թողարկում ես քո սեփական բոտը**՝ սկզբից մինչև վերջ։

*Նույն repo-ն, նույն հմտությունները։ Գաղափարը քոնն է։*

---

## Ընտրիր քո գաղափարը

Ընտրիր մեկը, կամ հորինիր քո սեփականը․

- 🌍 **Թարգմանիչ**․ Armenian ↔ English ըստ պահանջի
- ❓ **Վիկտորինայի վարպետ**․ հարցնում է, գնահատում, պահում է շարքերը *(դու պահոց ունես!)*
- 🎭 **Տրամադրության ընթերցող**․ գուշակում է հաղորդագրության տրամադրությունը
- 📝 **Ամփոփիչ**․ փակցրու մի մեծ տեքստ, ստացիր երեք տող

Այն պետք է **աշխատի կենդանի՝ քո տեղակայած բոտում** դեմոյի պահին։

---

## Պլանավորիր նախքան կոդ գրելը

Նախքան ստեղնաշարին դիպչելը, գրիր **երեք տող**․

1. **Հրաման(ներ)ը**․ ի՞նչ է մուտքագրում օգտատերը։ `/quiz`, `/translate <text>`...
2. **Մտածո՞ւմ է։** Ստատիկ պատասխան, թե՞ կանչում է AI-ին (`ask_ai`)։
3. **Հիշո՞ւմ է։** Մեկանգամյա, թե՞ օգտագործում է պահոցը (`note:{id}` ձևանմուշ)։

Հնարավորություն, որը կարող ես երեք տողով նկարագրել, կարող ես և կառուցել։

---

## Կառուցիր այն․ դու ղեկավարում ես, Claude Code-ն օգնում է

Նույն բաղադրատոմսն ամբողջ շաբաթվա պես․ **handler → `/help` գրառում → թեստ → վերագործարկում**։

- Հարցրու Claude Code-ին պարզ անգլերենով; այն խմբագրում է `bot/handlers.py`-ն և կարող է գործարկել բոտը
- **Կարդա ամեն տող։** Չե՞ս կարող բացատրել։ Խնդրիր, որ բացատրի, կամ չեղարկիր այն
- Ավելացրու թեստ `tests/`-ում; `.\make.ps1 test`-ը **կանաչ**՝ նախքան թողարկելը

> Դու ինժեներն ես։ Claude Code-ն օգնականն է։ Դեմոյի ժամանակ դու ես բացատրում քո կոդը։

---

## Թողարկիր այն կենդանի

Երեկ տեղակայեցիր, ուստի այսօր ընդամենը մեկ քայլ է․

```bash
git commit -am "Add my feature" && git push
```

**~3 վայրկյան անց քո կենդանի բոտն ունի այդ հնարավորությունը։** Push-to-deploy-ն անում է մնացածը։

- Push-to-deploy կարգավորած չէ՞։ `.\make.ps1 deploy-pa`-ն դեռ աշխատում է
- Ստուգիր քո **կենդանի** բոտի վրա, որ հնարավորությունն աշխատում է, նախքան դեմոն

---

## Դեմոյի օր

1. Հրապարակիր քո բոտի օգտանունը սենյակի համար
2. Փորձիր բոլորի բոտը, գտիր նրանց հնարավորությունը
3. Քվեարկիր․ ամենազվարճ կերպարը, ամենաօգտակար հնարավորությունը, լավագույն անակնկալը

**Նույն բոտը, որ սկսեցիր Օր 1-ին, հիմա քոնն է, և այն կենդանի է՝ համացանցում։**

---

## Վերջին բան․ արձագանք

Պատմիր մեզ, թե ինչպես անցավ՝ ուղիղ Telegram-ից։ Անձնական հաղորդագրություն ուղարկիր TA բոտին՝ **@JillWatson_Bot**․

```
/feedback This workshop was amazing!
```

Օգտագործիր քո սեփական բառերը՝ լավ թե վատ․ ամեն ինչ օգնում է մեզ այն ավելի լավը դարձնել։

**Շնորհակալություն!** 🎉
