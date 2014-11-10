FILE? = exercicio

all :
	pandoc -o 2014-RC-$(FILE).pdf -M lang=portuges --template=template.latex --variable mainfont="FreeSerif" --latex-engine=xelatex --toc --bibliography library.bib --csl ./evolution.csl $(FILE).md

tufte :
	pandoc -o 2014-RC-$(FILE).pdf -M lang=portuges --template=handout.latex --variable mainfont="FreeSerif" --latex-engine=xelatex --toc --bibliography library.bib --csl ./evolution.csl $(FILE).md

