O_DIR        := Output
TEX_O        := --output-directory=$(O_DIR)
URMD         := $(wildcard *.brief.md)
BRIEF_OPT    := --standalone --latex-engine=xelatex --no-tex-ligatures -f markdown
BRIEF_TMPL   := Template/template-letter.tex

BRIEF        := $(patsubst %.brief.md,$(O_DIR)/%.pdf,$(URMD))

all : $(BRIEF)

## BRIEF
$(O_DIR)/%.pdf: %.brief.md
	@pandoc $(BRIEF_OPT) --template=$(BRIEF_TMPL) \
	$< -o $@

clean : ;
	@-rm \
	$(BRIEF)

clean-all : ;
	@-rm \
	$(BRIEF)

rebuild-all : clean-all all
