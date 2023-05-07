LIBPATH := ../base
BUILDPATH := build
FIGURES := $(wildcard figures/*)
PAGES := $(wildcard pages/*.tex)
LIBS := $(wildcard $(LIBPATH)/*)

TEX = xelatex
BIB = bibtex
MKDIR_P = mkdir -p

all: bachelor master doctor

bachelor: directories $(BUILDPATH)/bachelor.pdf
master: directories $(BUILDPATH)/master.pdf
doctor: directories $(BUILDPATH)/doctor.pdf

$(BUILDPATH)/%.pdf: export TEXINPUTS=$(LIBPATH):
$(BUILDPATH)/%.pdf: export BSTINPUTS=$(LIBPATH):
$(BUILDPATH)/%.pdf: %.tex $(PAGES) $(FIGURES) $(LIBS) directories
	$(TEX) -output-directory $(BUILDPATH) --no-pdf --interaction=nonstopmode $<
	$(BIB) $(BUILDPATH)/$*.aux || true
	$(TEX) -output-directory $(BUILDPATH) --no-pdf --interaction=nonstopmode $<
	$(TEX) -output-directory $(BUILDPATH) --interaction=nonstopmode $<

directories: ${BUILDPATH}
${BUILDPATH}:
	${MKDIR_P} ${BUILDPATH}

clean:
	rm -rf $(BUILDPATH) *.log *.out *.blg *.bbl *.aux *.synctex.gz

.PHONY: clean directories bachelor master doctor
