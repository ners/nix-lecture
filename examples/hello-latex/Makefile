build: hello.pdf

hello.pdf: hello.tex
	pdflatex $<

install: hello.pdf
	install -D --mode=644 $< $(out)
