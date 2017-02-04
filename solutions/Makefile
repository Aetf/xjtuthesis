LIBPATH := ../base
BUILDPATH := build
FIGURES := $(wildcard figures/*)
PAGES := $(wildcard pages/*.tex)
LIBS := $(wildcard $(LIBPATH)/*)

TARGETS = bachelor master doctor

TEX = xelatex
BIB = bibtex
MKDIR_P = mkdir -p

all: $(addprefix $(BUILDPATH)/, $(addsuffix .pdf, $(TARGETS)))

$(BUILDPATH)/%.pdf: export TEXINPUTS=$(LIBPATH):
$(BUILDPATH)/%.pdf: export BSTINPUTS=$(LIBPATH):
$(BUILDPATH)/%.pdf: %.tex $(PAGES) $(FIGURES) $(LIBS) directories
	$(TEX) -output-directory $(BUILDPATH) --no-pdf --interaction=nonstopmode $<
	TEXMFOUTPUT="$(BUILDPATH):" $(BIB) $(BUILDPATH)/$* || true
	$(TEX) -output-directory $(BUILDPATH) --no-pdf --interaction=nonstopmode $<
	$(TEX) -output-directory $(BUILDPATH) --interaction=nonstopmode $<

directories: ${BUILDPATH}
${BUILDPATH}:
	${MKDIR_P} ${BUILDPATH}

clean:
	rm -rf $(BUILDPATH) *.log *.out *.blg *.bbl *.aux *.synctex.gz

.PHONY: clean directories
