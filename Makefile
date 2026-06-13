# Build Marp slide decks (slides/*.md) into PDFs under presentation/.
#
# Requires marp-cli:  brew install marp-cli
#
# Usage:
#   make            # render every deck whose Markdown (or a shared image) changed
#   make slides     # same as the default target
#   make clean      # delete all rendered PDFs
#   make help       # list targets

MARP       ?= marp
SLIDE_DIR  := slides
OUT_DIR    := presentation
MARP_FLAGS := --pdf --allow-local-files

SOURCES := $(wildcard $(SLIDE_DIR)/*.md)
TARGETS := $(patsubst $(SLIDE_DIR)/%.md,$(OUT_DIR)/%.pdf,$(SOURCES))
IMAGES  := $(wildcard $(SLIDE_DIR)/img/*)

.PHONY: all slides clean help

all: slides

slides: $(TARGETS)

# Re-render a deck when its own Markdown — or any shared image — is newer
# than the existing PDF. Relative image paths in the decks (img/bg.png) are
# resolved against the Markdown file, so the output location does not matter.
$(OUT_DIR)/%.pdf: $(SLIDE_DIR)/%.md $(IMAGES) | $(OUT_DIR)
	$(MARP) $< $(MARP_FLAGS) -o $@

$(OUT_DIR):
	mkdir -p $@

clean:
	rm -f $(TARGETS)

help:
	@echo "make / make slides   render slides/*.md -> presentation/*.pdf"
	@echo "make clean           remove rendered PDFs"
