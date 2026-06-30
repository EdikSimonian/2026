---
marp: true
size: 16:9
paginate: true
backgroundImage: url('img/bg.png')
footer: 'Շաբաթ 1 · Օր 4 · Տեղակայում (Windows · PowerShell)'
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
  font-size: 21px;
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
## Շաբաթ 1, Օր 4: Տեղակայում — Windows

**Edik Simonian, Ամառ 2026**

<!--
NATIVE WINDOWS (Scoop + PowerShell) edition of Day 4, paired with
week1-day1-windows.md. Identical to the Mac/Linux deck (week1-day4.md) except
`make deploy-pa` -> `.\make.ps1 deploy-pa`, which needs PowerShell 7
(`scoop install pwsh`); make.ps1 auto-relaunches under pwsh if you started in 5.1.
-->

---

## Երեկ → այսօր

Ձեր բոտն ունի կերպար, հրամաններ, որոնք **մտածում** են, և **հիշողություն**, որը գոյատևում է վերագործարկումներից հետո։

Մի բան դեռ պակասում է․ այն աշխատում է միայն **այնքան ժամանակ, քանի դեռ ձեր նոութբուքը միացված է**։ Այսօր այն լքում է ձեր մեքենան և դառնում է **կենդանի՝ համացանցում**։

---

## Production շտկումներ, որոնք արդեն repo-ում են

- **Հաճախականության սահման**՝ `RATE_LIMIT` env var, լռելյայն 250 հաղորդագրություն/օգտատեր/օր
- **Պատմության կրճատում**՝ վերջին 20 հաղորդագրությունները յուրաքանչյուր օգտատիրոջ համար, 30-օրյա ժամկետ
- **Սպիտակ ցուցակ**՝ `ALLOWED_USERS`-ը բոտը դարձնում է **լուռ** անծանոթների համար
  *(լռություն, ոչ թե մերժում. սկաներները ոչինչ չեն իմանում)*
- **Dedupe**՝ Telegram-ը կրկին ուղարկում է webhook-ները․ բոտը երկու անգամ չի պատասխանի

Ամեն ինչ կառուցված է նույն տվյալների պահոցի վրա, որը դուք երեկ կարգավորեցիք։

---

## Polling-ից դեպի webhook

- Ողջ շաբաթ՝ **polling**, ձեր համակարգիչը Telegram-ից թարմացումներ է խնդրում
- Production-ում՝ **webhook**, Telegram-ը հրում է ձեր սերվերի URL-ին
- PythonAnywhere-ը նույն **Flask app**-ն է աշխատեցնում որպես միշտ-միացված worker
- Նույն կոդը, նույն `.env` գաղափարը՝ տարբեր է առաքման եղանակը

Հիմա ձեր բոտը **այլևս կարիք չունի ձեր նոութբուքի**։

---

## Մուտքի դուռը՝ `api/index.py`

| Route | Job |
|---|---|
| `/api/health` | «Worker-ը կենդանի՞ է» → `OK` |
| `/api/webhook` | Որտեղ Telegram-ը հաղորդագրություններ է առաքում |
| `/api/deploy` | Push-ի ժամանակ քաշում է նոր կոդը (սա կկարգավորենք) |

- Webhook-ը ստուգում է **գաղտնի token**՝ կեղծված հարցումները ստանում են 403։ Բոտն ինքն է այն գեներացնում և գրանցում առաջին գործարկման ժամանակ։
- `threaded=False` `bot/clients.py`-ում՝ handler-ները պետք է ավարտվեն հարցման ընթացքում, այլապես հարթակը կարող է դրանք սպանել պատասխանի կեսին։

---

## Տեղակայում՝ մեկ հրաման

<style scoped>
section { font-size: 21px; }
section pre { font-size: 17px; padding: 12px 22px; }
section ol { margin-top: 0.1em; }
section li { margin-bottom: 0.1em; }
</style>


1. Գրանցվեք **pythonanywhere.com**-ում (անվճար Beginner փաթեթ)
2. Ստեղծեք API token՝ *Account → API token*
3. Ավելացրեք ձեր լոկալ `.env`-ին.

```
PA_USERNAME=<your PA username>
PA_API_TOKEN=<the token>
```

4. Թողարկեք այն.

```powershell
.\make.ps1 deploy-pa
```

Այն ստեղծում է վեբ-հավելվածը և bash կոնսոլը, ապա **մեկ անգամ կանգ է առնում** բրաուզերում մեկ սեղմման համար (հաջորդ սլայդ)։

> Պետք է **PowerShell 7**՝ `scoop install pwsh`։ `.\make.ps1 deploy-pa`-ն ինքն իրեն վերագործարկում է `pwsh`-ի տակ ավտոմատ, եթե սկսել եք Windows PowerShell 5.1-ից։

<!--
Instructor (native Windows): deploy needs PowerShell 7 (scoop install pwsh);
make.ps1 relaunches under pwsh automatically, so 5.1 is fine to start from. The
PA console/web URLs are opened by hand in the browser anyway (the pause on the
next slide), so there's no WSL-style browser-auto-open gotcha here. See
setup/WINDOWS.md step 3.
-->

---

## Միակ դադարը՝ բացեք կոնսոլը

`.\make.ps1 deploy-pa`-ն ինքնաշխատ է **բացի մեկ անգամից**։ Այն ստեղծում է ձեր վեբ-հավելվածը, բացում է **bash կոնսոլ** PA-ի վրա և կանգ է առնում.

```
!!! ONE-TIME MANUAL STEP !!!
Open this URL, wait for the shell prompt, then come back:
https://www.pythonanywhere.com/user/<you>/consoles/<id>/
```

- PA-ն կոնսոլում հրամաններ չի աշխատեցնի, քանի դեռ այն **մեկ անգամ չի բացվել** բրաուզերում
- Բացեք URL-ը → սպասեք `$` հուշմանը → սեղմեք **Enter** ձեր տերմինալում
- Սցենարը վերցնում է ղեկը՝ clone repo → venv → install deps → կարգավորում → reload

---

## Ինչ հենց նոր տեղի ունեցավ

Սցենարը ստեղծեց վեբ-հավելվածը, կլոնավորեց **ձեր fork-ը**, կառուցեց venv-ը, վերբեռնեց production-ի `.env`, ներառյալ.

```
SQLITE_PATH=/home/<you>/bot.db
WEBHOOK_URL=https://<you>.pythonanywhere.com/api/webhook
```

`WEBHOOK_URL` = ինքնագրանցում՝ ամեն գործարկման ժամանակ բոտն ասում է Telegram-ին *«առաքիր այստեղ»*։ Ձեռքով `curl` պետք չէ։

---

## Ստուգեք ինժեների պես

1. `https://<you>.pythonanywhere.com/api/health` → `OK`
2. Հաղորդագրություն ուղարկեք ձեր բոտին՝ պատասխանն այժմ գալիս է սերվերից
3. **Փակեք բոտը ձեր համակարգչում (`Ctrl+C`)։ Կրկին գրեք նրան։** 🎉
4. Ինչ-որ բան այն չէ՞։ *Web tab → error log*՝ կարդացեք traceback-ը

---

## Push-to-deploy

Մեկանգամյա կարգավորում ձեր fork-ի վրա, *Settings → Secrets → Actions*-ում.

| Secret | Value |
|---|---|
| `DEPLOY_SECRET` | պատահական տող (string) (նաև PA `.env`-ում) |
| `PA_DEPLOY_URL` | `https://<you>.pythonanywhere.com/api/deploy` |

Ապա՝

```bash
git commit -am "New personality" && git push
```

**~3 վայրկյան անց կենդանի բոտը թարմացված է։** Ահա այսպես են թողարկում իրական թիմերը։

---

## Մանր տառերով գրվածը ⚠️

- PA անվճար փաթեթ՝ սեղմեք **"Run until 3 months from today"** թարմացման կոճակը **ամեն 3 ամիսը մեկ**, այլապես հավելվածն ինքնաշխատ կանջատվի
- PA-ն ձեզ նամակ է ուղարկում մեկ շաբաթ առաջ։ Այնուամենայնիվ դրեք հեռախոսի հիշեցում։
- Անվճար փաթեթը սահմանափակում է ելքային համացանցը սպիտակ ցուցակով․ Telegram-ը և Cerebras-ը դրա մեջ են

---

## Այսօր → Վաղը

Այսօր՝ ձեր բոտը **կենդանի է՝ համացանցում**՝ ինքն իրեն թարմացնելով ամեն push-ի ժամանակ։

**Վաղը.** ամբողջ օրը ձերն է։ Դուք նախագծում և թողարկում եք ձեր **սեփական** բոտը՝ սկզբից մինչև վերջ։
