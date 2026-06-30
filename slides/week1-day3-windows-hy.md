---
marp: true
size: 16:9
paginate: true
backgroundImage: url('img/bg.png')
footer: 'Շաբաթ 1 · Օր 3 · Հրամաններ և հիշողություն (Windows · PowerShell)'
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
## Շաբաթ 1, Օր 3: Հրամաններ և հիշողություն — Windows

**Edik Simonian, Ամառ 2026**

<!--
NATIVE WINDOWS (Scoop + PowerShell) edition of Day 3, paired with
week1-day1-windows.md. Identical to the Mac/Linux deck (week1-day3.md) except
`make test` -> `.\make.ps1 test`. Everything else (Python edits, git) is the same.
-->

---

## Դեկորատորները 60 վայրկյանում

```python
@bot.message_handler(commands=["start"], func=is_allowed)
def cmd_start(message):
    ...
```

- Դեկորատորը **գրանցում** է քո ֆունկցիան բոտի մոտ
- *«Երբ հաղորդագրությունը համընկնում է `/start`-ին, կանչիր այս ֆունկցիան»*
- Դու ինքդ `cmd_start`-ը չես կանչում, դա անում է բոտը
- Սա այն ամենն է, ինչ պետք է իմանաս ցանկացած հրաման ավելացնելու համար

---

## Ներկառուցվածները՝ կարդա նախքան գրելը

| Հրաման | Ինչ է անում |
|---|---|
| `/start` | Ողջույնի հաղորդագրություն (արդեն խմբագրել ես) |
| `/help` | Թվարկում է հրամանները (երեկ խմբագրել ես) |
| `/reset` | Մաքրում է քո զրույցի պատմությունը |
| `/about` | Մոդելի, պահոցի և հոստինգի մասին տեղեկություն |

`/reset`-ը մաքրում է *պատմությունը*։ Մի րոպե, ի՞նչ պատմություն։ **Դա այսօրվա երկրորդ կեսն է։**

---

## Կենդանի կոդ՝ `/joke`

Կոշտ կոդով գրված կատակը միշտ նույնն է պատմում։ Եկեք հրամանին ստիպենք **մտածել**՝

```python
@bot.message_handler(commands=["joke"], func=is_allowed)
def cmd_joke(message):
    reply = ask_ai(message.from_user.id, "Tell one short, clean programming joke.")
    bot.send_message(message.chat.id, reply)
```

`ask_ai(user_id, prompt)`-ն ուղարկում է մեկանգամյա հարցում և վերադարձնում պատասխանը — **ամեն անգամ թարմ կատակ**, ոչ մի ցուցակ պահելու կարիք չկա։

1. Ավելացրու մշակիչը (handler) `bot/handlers.py`-ում
2. Ավելացրու `/joke`-ը `/help`-ին
3. Վերագործարկիր, թեստավորիր

---

## Քո հերթն է՝ ընտրիր մեկը

Յուրաքանչյուրը հարցնում է AI-ին — ամեն անգամ թարմ արդյունք, ճիշտ ինչպես `/joke`-ը՝

- `/quote`՝ ինքնատիպ ոգևորող տող
- `/fact`՝ զարմանալի փաստ (թող AI-ն քեզ զարմացնի)
- `/compliment`՝ ինչ-որ մեկի օրը պայծառացրու
- `/roll`՝ զառի նետում — **բացառությունը**, զուտ Python (`random.randint`), առանց AI-ի

Նույն բաղադրատոմսը՝ մշակիչ → `/help`-ի գրառում → վերագործարկում → թեստ։

*Առաջինը կառուցիր ձեռքով, հաջորդը զուգակցիր Claude Code-ի հետ, բայց վերանայման շրջանի ժամանակ դու ես այն բացատրում։*

---

## Մակարդակ վեր՝ քո բառերը փոխանցիր AI-ին

`/roast <name>`՝ կարդա հրամանից հետո եկած բառերը և ուղարկիր AI-ին՝

```python
@bot.message_handler(commands=["roast"], func=is_allowed)
def cmd_roast(message):
    name = message.text.split(maxsplit=1)[1] if " " in message.text else "you"
    reply = ask_ai(message.from_user.id, f"Write a short, playful, friendly roast of {name}.")
    bot.send_message(message.chat.id, reply)
```

`message.text.split()`՝ ահա սա է արգումենտների վերլուծությունը։
*(Repo-ի `/model` մշակիչը նույն հնարքն է անում, այն ակտիվանում է Շաբաթ 2-ում։)*

---

## Ամրացրու թեստով

- Բացիր `tests/test_handlers.py`-ը՝ տես, թե ինչպես է `/start`-ը թեստավորվում
- Գրիր նույն տեսքի թեստը **քո** հրամանի համար
- `.\make.ps1 test`՝ կանաչ՝ լոկալ
- `git push`՝ կանաչ նաև GitHub Actions-ում

Առանց թեստի հրամանը հետագայում լուռ կկոտրվի։

---

## Կոդի վերանայման շրջան

1. Տեղափոխվիր մեկ աթոռ ձախ՝ քո հարևանի էկրանին
2. Կարդա այդ էկրանի մշակիչը **բարձրաձայն**, տող առ տող
3. Բացատրիր, թե ինչ է անում յուրաքանչյուր տողը, հարցրու, եթե չգիտես
4. Մեկ հաճոյախոսություն, մեկ առաջարկ, ապա վերադարձիր

Ուրիշների կոդը կարդալը իրական ծրագրային ինժեներիայի կեսն է։

---

## Խնդիրը

1. Ասա քո բոտին՝ *«իմ սիրած գույնը կապույտն է»*
2. Ապա հարցրու քո **հաջորդ իսկ հաղորդագրությունում**՝ *«ո՞րն է իմ սիրած գույնը»*
3. **Նա գաղափար անգամ չունի։**

Յուրաքանչյուր պատասխան մոռանում է նախորդը․ սա Օր 1-ի «stateless mode» ծանուցումն է։ Հրամանները պատրաստ են, **հիմա բոտին հիշողություն ենք տալիս։**

---

## Բանալի–արժեք պահոց = պահարաններ

- Պահարանների մի պատ 🔐
- **Բանալին** = պահարանի համարը → `chat:12345`
- **Արժեքը** = ինչ էլ որ ներսում դնես → զրույցը
- `get(key)` / `set(key, value)`՝ ահա ողջ API-ն
- Մերն ունի նաև **TTL**՝ պահարաններ, որոնք ինքնամաքրվում են 30 օր հետո

Redis, DynamoDB, memcached, նույն գաղափարը։ Մերը SQLite է՝ տվյալների բազա մեկ ֆայլում։

---

## Միացրու այն

`.env`՝

```
SQLITE_PATH=./bot.db
```

- Վերագործարկիր → ասա սիրած գույնդ → նորից վերագործարկիր → հարցրու
- **Այն հիշում է։** Հայտնվեց `bot.db` ֆայլը՝ ահա հիշողությունը
- Ոչ գրանցում, ոչ սերվեր, ոչ քարտ։ Պարզապես ֆայլ է
- Ջնջիր տողը → սահուն վերադարձ stateless ռեժիմին (փորձիր)

---

## Ինչպես է բոտը հիշում զրույցները

Մոդելը **վիճակ չպահող (stateless)** է՝ ամեն API կանչ մոռանում է նախորդը։ Հիշողությունը *մեր* կոդն է, ոչ թե մոդելը։

```python
# bot/ai.py — runs on every message
history = get_history(user_id)          # load past turns from bot.db
history.append({"role": "user", "content": text})

messages = [{"role": "system", "content": SYSTEM_PROMPT}, *history]
reply = generate(user_id, messages)     # replay the whole chat

history.append({"role": "assistant", "content": reply})
save_history(user_id, history)          # write back: last 20, 30-day TTL
```

Բանալիավորված `chat:<your id>`-ով, ցուցակը պահվում է `bot.db`-ում, այնպես որ այն **գոյատևում է վերագործարկումներից հետո**։

---

## Կենդանի կոդ՝ `/remember` և `/recall`

```python
@bot.message_handler(commands=["remember"], func=is_allowed)
def cmd_remember(message):
    note = message.text.split(maxsplit=1)[1] if " " in message.text else ""
    store.set(f"note:{message.from_user.id}", note)
    bot.send_message(message.chat.id, "Saved!")
```

`/recall`-ը հայելային պատկերն է՝ `store.get(f"note:{...}")`։

<!-- Assumes SQLITE_PATH is set so store is not None; say this out loud. -->

---

## Ինքնուրույն կառուցում՝ լիարժեք նշումների հնարավորություն

- `/remember <text>`՝ ավելացրու նշում (ոչ թե փոխարինիր)
- `/recall`՝ թվարկիր **բոլոր** պահված նշումները
- `/forget`՝ մաքրիր դրանք

Հուշում՝ պահոցը պահում է **տողեր (strings)**։ Ցուցակ պահելու համար մուտքի ժամանակ `json.dumps` արա, ելքի ժամանակ՝ `json.loads`։

---

## Այսօր → Վաղը

Այսօր քո բոտն ունի հրամաններ, որ **մտածում են**, և հիշողություն, որ **գոյատևում է վերագործարկումներից** — և դու պարզեցիր, թե իրականում ինչ է `/reset`-ը զրոյացնում։

**Վաղը.** տեղակայում (deploy)։ Բոտը դառնում է կենդանի՝ համացանցում և թարմացվում ամեն `git push`-ի դեպքում, այնպես որ այլևս քո նոութբուքի կարիքը չի ունենա։
