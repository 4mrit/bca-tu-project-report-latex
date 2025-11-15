
TEX := main.tex
OUT := main.pdf
LATEXMK := latexmk
LATEXMKFLAGS := -pdf -silent
ENGINE ?= pdf

.PHONY: all pdf clean view

all: pdf

pdf:
	$(LATEXMK) $(LATEXMKFLAGS) $(TEX)

clean:
	$(LATEXMK) -C $(TEX)
	-@rm -f $(OUT)

view: pdf
	open $(OUT)

.PHONY: docker
docker:
	@bash scripts/docker-build.sh $(ENGINE)

