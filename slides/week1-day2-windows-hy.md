---
marp: true
size: 16:9
paginate: true
backgroundImage: url('img/bg.png')
footer: 'Շաբաթ 1 · Օր 2 · Բնավորություն և հուշումներ (Windows · PowerShell)'
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
## Շաբաթ 1, Օր 2. Բնավորություն և հուշումներ — Windows

**Edik Simonian, Ամառ 2026**

<!--
NATIVE WINDOWS (Scoop + PowerShell) edition of Day 2, paired with
week1-day1-windows.md. Identical to the Mac/Linux deck (week1-day2.md) except
`make` -> `.\make.ps1` and the Claude Code connect: on this track the connect
script ships in the bot repo, so students run `.\make.ps1 claude KEY` from their
telegram-pythonanywhere-bot folder — no separate 2026 clone. See setup/WINDOWS.md.
-->

---

## Հիմնական կանոններ

- Սեմինարի ընթացքում տեսանյութեր չդիտել
- Սեմինարի ընթացքում խաղեր չխաղալ
- Կողմնակի զրույցները պահեք կարճ և հանգիստ
- Եթե օգտագործում եք AI-ի ստեղծած կոդ, պետք է **լիովին հասկանաք այն** և կարողանաք բացատրել, թե ինչպես է աշխատում

---

## Ի՞նչ է համակարգային հուշումը

- Հրահանգ, որը մոդելը տեսնում է **ամեն զրույցից առաջ**
- Օգտատերը այն երբեք չի տեսնում, բայց ամեն պատասխան ենթարկվում է դրան
- Այն սահմանում է՝ ով է բոտը, ինչպես է խոսում, ինչն է հրաժարվում անել
- **Այս նախագծի ամենահզոր տողը**

Նույն մոդելը + այլ համակարգային հուշում = լիովին այլ բոտ։

---

## Գտեք այն կոդում

`bot/config.py`:

```python
SYSTEM_PROMPT = (
    "You are a knowledgeable and concise AI assistant. "
    "Answer clearly and directly. Avoid unnecessary filler. "
    "Keep responses appropriately brief for a chat interface."
)
```

Կենդանի փորձարկում՝ փոխեք այն՝ *«Դու պատասխանում ես միայն հանգով»*։
Վերագործարկեք։ Հարցրեք ցանկացած բան։

<!-- Demo this on the projector before students touch their own. -->

---

## Կերտեք ձեր կերպարը

Ընտրեք մեկը կամ հորինեք ձեր սեփականը՝

- 👨‍🍳 **Խոհարար**՝ ամեն ինչին պատասխանում է բաղադրատոմսի տեսանկյունից
- 📚 **Ուսուցիչ**՝ բացատրում է քայլ առ քայլ, հակադարձ հարցեր է տալիս
- 🎲 **Խաղավար**՝ զրույցը վերածում է արկածի
- 🎤 **Կատակերգակ**՝ չի կարող չզվարճացնել

Գրեք 3–5 նախադասություն՝ ով է բոտը, ինչպես է խոսում, մեկ բան, որ միշտ անում է, մեկ բան, որ երբեք չի անում։

---

## Փոխեք ուղեղը

Մոդելը միջավայրի փոփոխական է `.env`-ում։

```
AI_MODEL=gpt-oss-120b      # default
AI_MODEL=zai-glm-4.7       # try this one too
```

- Նույն կերպար, այլ մոդել՝ ի՞նչ է փոխվում։
- Արագություն ընդդեմ խորության՝ չափեք պատասխանների ժամանակը, համեմատեք ոճերը

<!--
Cerebras rotates its free lineup; verify with GET /v1/models before
class and update these names on the slide if needed.
-->

---

## Զույգ ցուցադրություն

1. Փոխեք տեղերը (կամ կիսվեք բոտի օգտանուններով)
2. 5 րոպե զրուցեք ձեր զուգընկերոջ բոտի հետ
3. Միայն պատասխաններից գուշակեք նրա համակարգային հուշումը
4. Հետադարձ կապ՝ մեկ բան, որ աշխատում է, մեկ բան, որ պետք է բարելավել

Որքան արագ զուգընկերը կարողանա գուշակել ձեր հուշումը, այնքան լավ է։

---

## Դարձրեք բոտը իր ինքնությանը համապատասխան

Երկու հրաման դեռ նկարագրում են *հին* բոտը՝

- `/help`՝ պետք է թվարկի, թե ինչ է անում **ձեր** բոտը, իր ձայնով
- `/about`՝ պետք է ներկայացնի **ձեր** կերպարը

Երկուսն էլ գտնվում են `bot/handlers.py`-ում։ Խմբագրեք դրանք այնպես, ինչպես երեկ խմբագրեցիք `/start`-ը։

---

## Ծանոթացեք Claude Code-ի հետ

**AI զույգ-ծրագրավորող**, որ աշխատում է ձեր տերմինալում։

- Կարդում է ձեր նախագիծը՝ իրական `bot/` ֆայլերը
- Գրում է կոդ, գործարկում հրամաններ, բացատրում սխալները
- Դուք հարցնում եք պարզ անգլերենով, այն խմբագրում և թեստավորում է

Այսօր դուք ձեռքով ձևավորեցիք ձեր բոտը։ Հիմա ծանոթացեք գործիքին, որ կօգնի կառուցել հաջորդը, *մինչդեռ դուք եք գլխավորը*։

---

## Միացրեք այն սեմինարի AI-ին

Ձեր **բոտի թղթապանակից** (`telegram-pythonanywhere-bot`) գործարկեք միացման հրամանը՝

```powershell
.\make.ps1 claude sk-your-key-here
```

Օգտագործեք դասարանում բաժանված անձնական բանալին։

Այն ստուգում է բանալին, անհրաժեշտության դեպքում տեղադրում Claude Code, միացնում սեմինարի gateway-ին և գործարկում `claude`։ Միացման սցենարը ներառված է այս repo-ում — ուրիշ ոչինչ պետք չէ կլոնավորել։

<!--
Instructor (native Windows): `.\make.ps1 claude` forwards to
setup/connect-claude-code.ps1 in the BOT repo — no separate 2026 clone needed
(the Mac/Linux/WSL track clones it only to reach connect-claude-code.sh). Confirm
before class: the exact gateway base URL (no /v1; Caddy routes to LiteLLM's
Anthropic path), the model alias, and how each student gets their key
(gyumri-NN / yerevan-NN). Setting ANTHROPIC_AUTH_TOKEN skips Claude Code's login
prompt. Manual env-var route: setup/CLAUDE-CODE.md "native Windows PowerShell".
-->

---

## Պահեք Claude Code-ը միացված

<style scoped>
section { font-size: 23px; }
section pre { font-size: 19px; }
section li { margin-bottom: 0.15em; }
</style>


Ուզո՞ւմ եք, որ նոր տերմինալները մնան միացված։

```powershell
.\make.ps1 claude sk-your-key-here -Persist
```

Սա պահպանում է սեմինարի կարգավորումները ձեր PowerShell `$PROFILE`-ում՝

- նույն անձնական դասարանային բանալին
- սեմինարի gateway-ի URL-ը
- մոդելի կարգավորումները, որոնք պետք են Claude Code-ին

Նոր տերմինալի պատուհանները կարող են անմիջապես գործարկել `claude`։

> **Ընդհանուր լաբորատոր համակարգի՞չ։ Բաց թողեք `-Persist`-ը։** Այն գրում է ձեր դասարանային բանալին համակարգչի PowerShell `$PROFILE`-ում, որտեղ հաջորդ աշակերտը կժառանգի այն — փոխարենը ամեն աշխատաշրջանի համար մեկ անգամ գործարկեք պարզ հրամանը (նախորդ սլայդ)։

<!--
Instructor (native Windows): -Persist on a shared machine leaves the student's
class key in their PowerShell $PROFILE for the next student — see setup/WINDOWS.md.
Cleanup: remove the workshop block from the file at $PROFILE.
-->

---

## Օգտագործեք այն, բայց մնացեք գլխավորը

`claude`-ի ներսում պարզապես հարցրեք պարզ անգլերենով՝

> *«Թարմացրու `/about`-ը `bot/handlers.py`-ում, որպեսզի ներկայացնի իմ կերպարը, իր ձայնով»։*

- Այն խմբագրում է ֆայլերը և կարող է գործարկել բոտը՝ թեստավորելու համար
- **Կարդացեք ամեն տող, որ այն գրում է։** Չե՞ք կարողանում բացատրել։ Խնդրեք, որ բացատրի, կամ չեղարկեք այն
- *AI-ն գրեց այն ≠ դուք հասկանում եք այն*։ Դուք պատասխանատու եք ամեն տողի համար, որ թողարկում եք

Claude Code-ը օգնականն է։ **Դուք ինժեներն եք։**

---

## Այսօր → Վաղը

Այսօր ձեր բոտն ունի բնավորություն, և դուք ծանոթացաք Claude Code-ի՝ ձեր զույգ-ծրագրավորողի հետ տերմինալում։

**Վաղը՝** նոր հնարավորություններ։ Դուք կգրեք ձեր սեփական slash-հրամանները, ներառյալ մեկը, որ կանչում է հենց AI-ին, իսկ Claude Code-ը կօգնի ձեզ կառուցել։
