PDFC=pdflatex
CFLAGS=-interaction nonstopmode -halt-on-error -file-line-error
export TEXINPUTS=../lib//:

build:
	$(PDFC) $(CFLAGS) main.tex

clean:
	rm -f main.aux main.log main.out
