FILE? = exercicio

all :
	pandoc -o ./output/$(FILE).pdf -M lang=portuges --template=template.latex --variable mainfont="FreeSerif" --latex-engine=xelatex --toc --bibliography library.bib --csl ./evolution.csl $(FILE).md

tufte :
	pandoc -o $(FILE).tex --template=tufte-handout.tex --biblatex --bibliography library.bib $(FILE).md
	lualatex $(FILE)
	biber $(FILE)
	lualatex $(FILE)
	lualatex $(FILE)
	rm  \
	$(FILE).aux \
	$(FILE).bbl \
	$(FILE).blg \
	$(FILE).bcf \
	$(FILE).run.xml \
	$(FILE).toc \


