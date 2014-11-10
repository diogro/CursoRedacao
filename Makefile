FILE? = exercicio

all :
	pandoc -o ./output/2014-RC-$(FILE).pdf -M lang=portuges --template=template.latex --variable mainfont="FreeSerif" --latex-engine=xelatex --toc --bibliography library.bib --csl ./evolution.csl $(FILE).md

tufte :
	pandoc -o ./output/2014-RC-$(FILE).pdf -M lang=portuges --template=handout.latex --latex-engine=xelatex --bibliography library.bib --csl ./evolution.csl $(FILE).md

