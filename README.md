# AI & Software Engineering Workshop

A two-week intensive workshop held in Armenia (Gyumri and Yerevan). Week 1 — build and deploy a Telegram bot powered by an LLM. Week 2 — train a 350M-parameter Armenian language model from scratch, fine-tune it into a chatbot, and connect it back to the Week 1 bot.

See [CURRICULUM.md](./CURRICULUM.md) for the full session-by-session breakdown.

## Slides

Built with [Marp](https://marp.app). Source decks live in [`slides/`](./slides) — one Markdown file per day, with shared images in `slides/img/`. Rendered PDFs are checked in under [`presentation/`](./presentation).

```bash
brew install marp-cli   # once
make                    # render slides/*.md -> presentation/*.pdf
make clean              # remove the rendered PDFs
marp -s slides/         # live preview in the browser while editing
```

Week 1 is identical in **Gyumri** and **Yerevan**; **Week 2** runs only in Yerevan.

### Gyumri — Week 1: Building a Telegram Bot with AI

| Day | Topic | Source | PDF |
|-----|-------|--------|-----|
| 1 | Setup and First Message | [md](./slides/week1-day1.md) | [pdf](./presentation/week1-day1.pdf) |
| 2 | Personality and Prompts | [md](./slides/week1-day2.md) | [pdf](./presentation/week1-day2.pdf) |
| 3 | Commands and Memory | [md](./slides/week1-day3.md) | [pdf](./presentation/week1-day3.pdf) |
| 4 | Deploy | [md](./slides/week1-day4.md) | [pdf](./presentation/week1-day4.pdf) |
| 5 | Build Your Own Bot | [md](./slides/week1-day5.md) | [pdf](./presentation/week1-day5.pdf) |

### Yerevan — Week 1: Building a Telegram Bot with AI

Same content as Gyumri Week 1, but the Yerevan lab is **Windows machines**. Two
setup tracks — pick the matching deck column below for the lab:

- **WSL (Ubuntu)** *(default)* — every slide command runs unchanged; setup and
  per-machine provisioning in [`setup/WSL.md`](./setup/WSL.md).
- **Native (Scoop + PowerShell)** — for labs where WSL can't be enabled; uses the
  repo's `.ps1` scripts (`make` → `.\make.ps1`), provisioned admin-free with Scoop.
  Setup in [`setup/WINDOWS.md`](./setup/WINDOWS.md). Every day has its own PowerShell
  deck (the `-windows.md` files) — `.\make.ps1 claude` on Day 2 and `.\make.ps1
  deploy-pa` (PowerShell 7) on Day 4 stand in for the `.sh` commands. An **Eastern
  Armenian** translation of the PowerShell track lives in the `-windows-hy.md` files
  (rightmost column).

| Day | Topic | Mac/Linux/WSL | Windows (PowerShell) | Windows · Հայերեն |
|-----|-------|---------------|----------------------|-------------------|
| 1 | Setup and First Message | [md](./slides/week1-day1.md) · [pdf](./presentation/week1-day1.pdf) | [md](./slides/week1-day1-windows.md) · [pdf](./presentation/week1-day1-windows.pdf) | [md](./slides/week1-day1-windows-hy.md) · [pdf](./presentation/week1-day1-windows-hy.pdf) |
| 2 | Personality and Prompts | [md](./slides/week1-day2.md) · [pdf](./presentation/week1-day2.pdf) | [md](./slides/week1-day2-windows.md) · [pdf](./presentation/week1-day2-windows.pdf) | [md](./slides/week1-day2-windows-hy.md) · [pdf](./presentation/week1-day2-windows-hy.pdf) |
| 3 | Commands and Memory | [md](./slides/week1-day3.md) · [pdf](./presentation/week1-day3.pdf) | [md](./slides/week1-day3-windows.md) · [pdf](./presentation/week1-day3-windows.pdf) | [md](./slides/week1-day3-windows-hy.md) · [pdf](./presentation/week1-day3-windows-hy.pdf) |
| 4 | Deploy | [md](./slides/week1-day4.md) · [pdf](./presentation/week1-day4.pdf) | [md](./slides/week1-day4-windows.md) · [pdf](./presentation/week1-day4-windows.pdf) | [md](./slides/week1-day4-windows-hy.md) · [pdf](./presentation/week1-day4-windows-hy.pdf) |
| 5 | Build Your Own Bot | [md](./slides/week1-day5.md) · [pdf](./presentation/week1-day5.pdf) | [md](./slides/week1-day5-windows.md) · [pdf](./presentation/week1-day5-windows.pdf) | [md](./slides/week1-day5-windows-hy.md) · [pdf](./presentation/week1-day5-windows-hy.pdf) |

### Yerevan — Week 2: Training a Language Model from Scratch

| Day | Topic | Source | PDF |
|-----|-------|--------|-----|
| 1 | Setup and Overview | [md](./slides/week2-day1.md) | [pdf](./presentation/week2-day1.pdf) |
| 2 | Data and Tokenization | [md](./slides/week2-day2.md) | [pdf](./presentation/week2-day2.pdf) |
| 3 | Training, Part 1 | [md](./slides/week2-day3.md) | [pdf](./presentation/week2-day3.pdf) |
| 4 | Training, Part 2 | [md](./slides/week2-day4.md) | [pdf](./presentation/week2-day4.pdf) |
| 5 | Fine-tuning and Deployment | [md](./slides/week2-day5.md) | [pdf](./presentation/week2-day5.pdf) |
