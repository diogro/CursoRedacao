FILE? = exercicio

all :
	pandoc -o ./output/$(FILE).pdf -M lang=portuges --template=template.latex --variable mainfont="FreeSerif" --latex-engine=xelatex --toc --bibliography library.bib --csl ./evolution.csl $(FILE).md

tufte :
	pandoc \
	$(FILE).md \
	--smart \
	--biblatex \
	--bibliography library.bib \
	-o tufte-book-body.tex

	# Pandoc likes to output p.~ or pp.~ in its \autocite, but I just want the numbers.
	sed -i 's/\\autocite/\\cite/g' tufte-book-body.tex
	sed -i 's/\\autocite/\\cite/g' tufte-book-body.tex
	# It would probably suffice to just do this but I don't want any nasty surprises:
	#sed -i 's/p.~//g' tufte-book-body.tex
	#sed -i 's/pp.~//g' tufte-book-body.tex

	# If ever bored, consider adding something to change \autocite[1-2] into \autocite[1--2]

	# Generate the PDF.
	lualatex tufte-book
	bibtex tufte-book
	lualatex tufte-book
	lualatex tufte-book
	mv tufte-book.pdf ./output/2014-RC-$(FILE).pdf

	# Remove these files after the work is done.
	rm  \
	tufte-book-body.tex \
	tufte-book.aux \
	tufte-book.bbl \
	tufte-book.blg \
	tufte-book.log \
	tufte-book.out 
	#tufte-book.bcf \
	#tufte-book.run.xml \
	#tufte-book.toc \
