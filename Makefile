PDFS := linux-desktop.pdf

HTMLS := linux-desktop.html

all: ${PDFS}

html: ${HTMLS}

%.pdf: %.xml
	python3 prettify.py $< | xsltproc fo.xsl - | fop -q -c fop.xconf - $@

%.html: %.xml
	python3 prettify.py $< | xsltproc -o $@ html.xsl -

.PHONY: all html clean

clean:
	rm -f ${PDFS} ${HTMLS}
