LIBPATH := ../../base
BUILDPATH := build
FIGURES := $(wildcard figures/*)
PAGES := $(wildcard pages/*.tex)
LIBS := $(wildcard $(LIBPATH)/*)

MKDIR_P = mkdir -p

all: bachelor master doctor

bachelor: directories $(BUILDPATH)/bachelor.pdf
master: directories $(BUILDPATH)/master.pdf
doctor: directories $(BUILDPATH)/doctor.pdf

$(BUILDPATH)/%.pdf: export TEXINPUTS=$(LIBPATH):
$(BUILDPATH)/%.pdf: export BSTINPUTS=$(LIBPATH):
$(BUILDPATH)/%.pdf: %.tex $(PAGES) $(FIGURES) $(LIBS)
	xelatex -output-directory $(BUILDPATH)/ --no-pdf --interaction=nonstopmode $<
	bibtex $* || true
	xelatex -output-directory $(BUILDPATH)/ --no-pdf --interaction=nonstopmode $<
	xelatex -output-directory $(BUILDPATH)/ --interaction=nonstopmode $<

directories: ${BUILDPATH}
${BUILDPATH}:
	${MKDIR_P} ${BUILDPATH}

clean:
	rm -rf $(BUILDPATH)

.PHONY: clean directories bachelor master doctor