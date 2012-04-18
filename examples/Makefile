pdf: bachelor master doctor

bachelor:
	xelatex --no-pdf --interaction=nonstopmode bachelor.tex
	bibtex bachelor || true
	xelatex --no-pdf --interaction=nonstopmode bachelor.tex
	xelatex --interaction=nonstopmode bachelor.tex

master:
	xelatex --no-pdf --interaction=nonstopmode master.tex
	bibtex master || true
	xelatex --no-pdf --interaction=nonstopmode master.tex
	xelatex --interaction=nonstopmode master.tex

doctor:
	xelatex --no-pdf --interaction=nonstopmode doctor.tex
	bibtex doctor || true
	xelatex --no-pdf --interaction=nonstopmode doctor.tex
	xelatex --interaction=nonstopmode doctor.tex
