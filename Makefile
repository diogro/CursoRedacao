FILE? = exercicio

all :
	pandoc -o ./output/$(FILE).pdf -M lang=portuges --template=template.latex --variable mainfont="FreeSerif" --latex-engine=xelatex --toc --bibliography library.bib --csl ./evolution.csl $(FILE).md

tufte :
	pandoc \
	$(FILE).md \
	-M lang=portuges \
	--latex-engine=lualatex \
	--smart \
	--biblatex \
	--template tufte-book.tex \
	--bibliography library.bib \
	-o tufte-book-body.tex

	# WTF is autocite?!
	sed -i 's/\\autocite/\\cite/g' tufte-book-body.tex

	 #Generate the PDF.
	lualatex tufte-book-body
	bibtex tufte-book-body
	lualatex tufte-book-body
	lualatex tufte-book-body
	mv tufte-book-body.pdf ./output/2014-RC-$(FILE).pdf

	 #Remove these files after the work is done.
	rm  \
	tufte-book-body.aux \
	tufte-book-body.bbl \
	tufte-book-body.blg \
	tufte-book-body.log \
	tufte-book-body.out 
	#tufte-book.bcf \
	#tufte-book.run.xml \
	#tufte-book.toc \
	#tufte-book-body.tex \
