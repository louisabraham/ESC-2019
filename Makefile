all: slides.pdf # images/

images/: slides.pdf
	-rm -r images
	-mkdir images
	convert -density 300 slides.pdf -quality 100 images/slide.jpg      

slides.html: slides.md references.bib
	pandoc -t revealjs -s -o slides.html slides.md

slides.pdf: slides.md references.bib
	pandoc -t beamer -V theme:boxes --filter pandoc-citeproc slides.md -o slides.pdf
