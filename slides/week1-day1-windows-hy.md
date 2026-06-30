---
marp: true
size: 16:9
paginate: true
backgroundImage: url('img/bg.png')
footer: 'Շաբաթ 1 · Օր 1 · Կարգավորում և առաջին հաղորդագրություն (Windows · PowerShell)'
---

<style>
/* --- Workshop theme (week1-day1 draft; promote to slides/theme.css once locked) --- */
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
.flow a { color: #c2561e; text-decoration: none; }
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
</style>

<!-- _class: title -->
<!-- _backgroundImage: url('img/title.jpg') -->
<!-- _paginate: false -->
<!-- _footer: '' -->

# AI & Software Engineering Workshop
## Շաբաթ 1, Օր 1. Կարգավորում և առաջին հաղորդագրություն — Windows

**Edik Simonian, Ամառ 2026**

<!--
This is the NATIVE WINDOWS (Scoop + PowerShell) edition of Day 1, for labs where
WSL can't be enabled. The WSL edition (week1-day1.md) is the default; the two
differ only in the terminal-setup slides and `make` -> `.\make.ps1`. Days 2-5
now have matching PowerShell decks (week1-dayN-windows.md), so this native track
is a full set — present the `-windows.md` deck each day. The PowerShell-swap slide
at the end stays as a quick reference if a Mac/Linux command ever turns up. See
setup/WINDOWS.md.
-->

---

## Բարև, ես Edik-ն եմ 👋

<img class="avatar" src="img/edik.jpg" alt="Edik Simonian" />

- **Գլխավոր ծրագրային ինժեներ NASA JPL-ում** 🚀 — 9 տարի
- **Բակալավր** **UC Davis**-ից · **Համակարգչային գիտության մագիստրոս** **Georgia Tech**-ից
- Իմ **երկրորդ տարին**՝ դասավանդելով այստեղ՝ **TUMO Yerevan**-ում

<style scoped>
.avatar {
  position: absolute;
  top: 158px;
  right: 96px;
  width: 300px;
  height: 300px;
  object-fit: cover;
  border-radius: 50%;
  border: 6px solid #fff;
  box-shadow: 0 12px 30px rgba(15, 34, 51, 0.28);
}
section li { max-width: 760px; }
</style>

---

## Սկզբից ծանոթանանք լսարանի հետ

Շրջանով, **30 վայրկյան յուրաքանչյուրին**՝

- **Ո՞վ ես դու։** Քո անունն ու դասարանը
- **Ի՞նչ համակարգչային գիտության դասերի ես հաճախել։** Ցանկացած ծրագրավորման դասընթաց՝ դպրոցում, ակումբում կամ առցանց — կամ առայժմ ոչ մեկը
- **Ի՞նչ ես հույս ունենում սովորել այս դասից։** Հմտություն, նախագծի տեսակ, կամ պարզապես այն, ինչ քեզ գրավեց

*Սխալ պատասխաններ չկան, նույնիսկ «դեռ ոչինչ»-ն ընդունելի է։ Հենց այստեղ ենք պարզում, թե ինչ ենք կառուցելու մինչև ուրբաթ։*

---

## Հիմնական կանոններ

- **Ոչ YouTube, ոչ խաղեր, ոչ հեռախոսազանգեր** սեմինարի ընթացքում
- **Արագ վիկտորինաներ** յուրաքանչյուր սեմինարի սկզբին, և կրկին՝ ընդմիջումից հետո
- **5 րոպեից ավելի մի՛ ուշացիր** — բաց թողած վիկտորինան այլևս չես կարող հանձնել
- **Ոչ մի կոդ մի՛ պատճենիր ChatGPT-ից** — օգտագործիր մեր տրամադրած Claude Code-ը և հասկացիր յուրաքանչյուր տող, որ ուղարկում ես
- **Ոչ մի անձնական տվյալ բոտին** — ոչ իրական անուններ, հասցեներ, հեռախոսներ կամ գաղտնաբառեր; զրույցները գնում են արտաքին AI ծառայության

---

## Սկզբից տեսնենք, թե ինչպես է աշխատում

<div class="flow"><a href="https://t.me/tele_pythonanywhere_bot" target="_blank" rel="noopener">t.me/tele_pythonanywhere_bot</a></div>

Ահա թե որտեղ կլինես մինչև **ուրբաթ**՝ քո սեփական բոտը, քո բնավորությունը, կենդանի՝ համացանցում։

*Գրիր նրան հիմա, հետո մենք մեկը զրոյից կկառուցենք։*

---

## Ինչ ես կառուցելու այս շաբաթ

- **Telegram բոտ**՝ իրական LLM-ով աշխատող
- Իր սեփական **բնավորությամբ**՝ դու ես այն նախագծում
- Հատուկ **slash հրամաններ**՝ դու ես դրանք կոդավորում
- **Հիշողություն**, որ պահպանվում է վերագործարկումներից հետո
- **Կենդանի՝ համացանցում** մինչև ուրբաթ, աշխատող նույնիսկ երբ քո համակարգիչն անջատված է

*Մինչև այսօրվա վերջը՝ բոտը պատասխանում է քեզ՝ քո մեքենայի վրա եղած կոդից։*

---

## Շաբաթը՝ օր առ օր

- **Օր 1, Կարգավորում և առաջին հաղորդագրություն** *(այսօր)*՝ token-ներ, `.\make.ps1 run`, քո առաջին `/start` խմբագրումը
- **Օր 2, Բնավորություն և հուշումներ**՝ համակարգային հուշում, որ բոտիդ ձայն է տալիս — և ծանոթացում Claude Code-ի հետ
- **Օր 3, Նոր հրամաններ**՝ ուղիղ եթերում կոդավորում ենք `/joke`, հետո դու քո սեփականն ես կառուցում՝ թեստով
- **Օր 4, Հիշողություն և տեղակայում**՝ հիշողություն, որ պահպանվում է վերագործարկումներից հետո, հետո՝ կենդանի PythonAnywhere-ի վրա
- **Օր 5, Կառուցիր քո սեփական բոտը**՝ նախագծիր ու թողարկիր հնարավորություն, որ ամբողջովին քոնն է, հետո՝ ցուցադրություն

*Ամեն օր հիմնվում է նախորդի վրա — մինչև ուրբաթ այն քոնն է և առցանց։*

---

## Ի՞նչ է բոտը

Telegram-ը քո կոդի հետ խոսում է երկու եղանակով՝

- **Polling**՝ քո կոդը անընդհատ հարցնում է Telegram-ին *«նոր հաղորդագրություններ կա՞ն»*
  → այն, ինչ օգտագործում ենք **այսօր**, քո համակարգչի վրա
- **Webhook**՝ Telegram-ը յուրաքանչյուր հաղորդագրություն հրում է քո սերվերի URL-ին
  → այն, ինչ օգտագործում ենք **Օր 4**, production-ում

*Բոտի կոդը նույնն է երկու դեպքում էլ։ Փոխվում է միայն առաքման եղանակը։*

---

## Տեխնոլոգիական կույտը

<div class="flow">Telegram → Flask (Python) → Cerebras → reply</div>

- **Telegram Bot API**՝ հաղորդագրությունների ինտերֆեյսը
- **Flask**՝ ստանում է հաղորդագրությունները
- **Cerebras**՝ գործարկում է LLM-ը, որ գրում է պատասխանները *(անվճար փաթեթ)*
- **SQLite**՝ հիշողություն *(Օր 4)*
- **PythonAnywhere**՝ հոստինգ *(Օր 4)*
- **GitHub**՝ քո կոդը, քո թեստերը, քո տեղակայումները

---

## Սկզբից՝ կարգավորիր քո գործիքակազմը

*Այս լաբորատորիան աշխատում է **Windows**-ով, ուստի մենք աշխատում ենք **PowerShell**-ով՝ **Scoop**-ով — փաթեթների կառավարիչ, որ տեղադրում է մեր գործիքները **առանց ադմինի իրավունքների**։*

Բացիր **PowerShell**-ը (Start menu → գրիր *PowerShell*), հետո գործարկիր **մեկ անգամ**՝

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
irm get.scoop.sh | iex
scoop install git python gh
```

> Քո սեփական Mac-ի կամ Linux-ի նոութբո՞ւքն է։ Արդեն պատրաստ ես — անցիր Setup 1-ին։

<!--
Instructor: lab machines can be pre-provisioned with Scoop + git/python/gh so
students skip this slide — see setup/WINDOWS.md. The Set-ExecutionPolicy line is
also what lets the repo's .ps1 scripts (make.ps1, connect-claude-code.ps1) run.
PowerShell 7 (scoop install pwsh) is only needed for Day 4's deploy.
-->

---

## Ստուգիր քո գործիքակազմը

Ամեն տող պետք է տպի տարբերակի համարը — եթե որևէ մեկը բացակայում է, ասա մեզ։

```powershell
git --version
python --version
gh --version
```

Հետո անցիր քո **home** թղթապանակ, որտեղ կլինեն քո նախագծերը։

```powershell
cd ~        # your C:\Users\<you> folder
```

*Խրվե՞լ ես։ `setup/WINDOWS.md`-ն ունի լուծումները — «scripts disabled», Python-ը PATH-ում չէ, PowerShell 7։*

---

## Setup 1 of 3: GitHub

1. Ստեղծիր GitHub հաշիվ *(եթե չունես)*
2. **Fork** արա [`EdikSimonian/telegram-pythonanywhere-bot`](https://github.com/EdikSimonian/telegram-pythonanywhere-bot)-ը — քո սեփական պատճենը, որ պետք է Օր 4-ի ավտո-տեղակայման համար
3. Clone արա քո fork-ը և տեղադրիր.

```powershell
git clone https://github.com/<your-username>/telegram-pythonanywhere-bot.git
cd telegram-pythonanywhere-bot
.\make.ps1 install
```

---

## Setup 2 of 3: Telegram բոտի token

1. Telegram-ում փնտրիր **@BotFather**
2. Ուղարկիր `/newbot`
3. Ընտրիր անուն, հետո՝ `bot`-ով վերջացող օգտանուն
4. Պատճենիր **token**-ը (նման է `7123456789:AAF...`-ի)

<!--
Students under 13 (16 in EU): pair with a parent/teacher account per the
README's age-requirements section.
-->

---

## Setup 3 of 3: AI API բանալի

1. Գրանցվիր **cloud.cerebras.ai**-ում *(անվճար, առանց վարկային քարտի)*
2. Profile-ի պատկերակ → **API Keys** → **Create new API key**
3. Պատճենիր բանալին (նման է `csk-...`-ի)

<!--
Instructor option: skip signups entirely and hand out pre-made gateway
keys; the bot accepts any OpenAI-compatible endpoint via AI_BASE_URL.
Verify the current Cerebras free lineup with GET /v1/models before class.
-->

---

## Միացրու. `.env`

```powershell
copy .env.example .env
```

Կարգավորիր երկու տող՝

```
TELEGRAM_BOT_TOKEN=<your BotFather token>
AI_API_KEY=<your Cerebras key>
```

Մնացածը թող այնպես, ինչպես կա։

> Գաղտնիքներն ապրում են `.env`-ում։ Երբեք կոդում, երբեք git-ում։

---

## Առաջին շփումը

```powershell
.\make.ps1 run
```

```
Bot @your_bot_username starting in polling mode.
Send your bot a message on Telegram to try it out.
```

Գրիր քո բոտին։ Դիտիր, թե ինչպես է փոխանակումը հայտնվում քո տերմինալում։

*«Stateless mode»-ն սպասելի է։ Հիշողությունը կգա Օր 4-ին։*

---

## Ապացուցիր, որ աշխատում է՝ ինժեների պես

```powershell
.\make.ps1 test
```

- Ամբողջ հավաքածուն աշխատում է **օֆլայն**՝ ոչ API բանալիներ, ոչ ցանց
- **Նույն հավաքածուն** աշխատում է GitHub Actions-ում քո fork-ին ուղարկվող ամեն push-ի ժամանակ
- Կանաչ նշանը GitHub-ում = քո բոտի տրամաբանությունը դեռ աշխատում է

---

## Քո առաջին կոդի խմբագրումը

`bot/handlers.py`:

```python
@bot.message_handler(commands=["start"], func=is_allowed)
def cmd_start(message):
    bot.send_message(
        message.chat.id,
        "Hello! I'm your AI assistant...",
    )
```

Փոխիր ողջույնը → `Ctrl+C` → `.\make.ps1 run` → ուղարկիր `/start`։

**Դու հենց նոր թողարկեցիր քո առաջին փոփոխությունը։**

---

## Հետագա սլայդներում՝ քո PowerShell փոխարկումը

Ամեն օր ունի համապատասխան **Windows սլայդաշար** — բայց եթե երբևէ Mac/Linux հրաման հայտնվի, երեք փոխարկում այն դարձնում են քոնը.

| Սլայդը ցույց է տալիս | Դու գրում ես |
|---|---|
| `make <thing>` | `.\make.ps1 <thing>` |
| `./connect-claude-code.sh KEY` | `.\make.ps1 claude KEY` |
| `--persist` դրոշ | `-Persist` |

Մնացած ամեն ինչը — `git`, `gh`, ֆայլերի խմբագրումը — **ճիշտ նույնն է**։

> Օր 4-ի `.\make.ps1 deploy-pa`-ն պահանջում է PowerShell 7՝ `scoop install pwsh`։

---

## Այսօր → Վաղը

Այսօր բոտն աշխատում է քո համակարգչի վրա և պատասխանում է որպես ընդհանուր օգնական։

**Վաղը.** նախագծի ամենահզոր մեկ տողը՝ **համակարգային հուշումը**։ Քո բոտը բնավորություն է ստանում։
