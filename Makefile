#
# Makefile for generating pdf docs
#

PDFS := linux-desktop.pdf

HTMLS := linux-desktop.html

all: ${PDFS}

html: ${HTMLS}

DOCBOOK_RNG := docbook-5.1/rng/docbook.rng

%.pdf: %.xml
	python3 prettify.py '$^' tmp-'$^'
	python3 validate.py tmp-'$^'
	xsltproc -o '$^'.fo fo.xsl tmp-'$^'
	fop -q -c fop.xconf '$^'.fo $@
	rm -f tmp-'$^' '$^'.fo

%.html: %.xml html.xsl
	python3 prettify.py $< | xsltproc -o $@ html.xsl -

.PHONY: all html clean

clean:
	rm -f ${PDFS} ${HTMLS}
