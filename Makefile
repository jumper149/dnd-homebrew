PDFC=pdflatex
CFLAGS=-interaction nonstopmode -halt-on-error -file-line-error

build:
	cd Harpoon/ && $(PDFC) $(CFLAGS) main.tex

clean:
	cd Harpoon/ && rm -f main.aux main.log main.out
