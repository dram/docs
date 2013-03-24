#
# Makefile for generating pdf docs
#

PDFS := linux-desktop.pdf

HTMLS := linux-desktop.html

all: ${PDFS}

html: ${HTMLS}

JING_JAR := ${HOME}/tools/jing-20091111/bin/jing.jar
DOCBOOK_RNG := ${HOME}/docbook-5.0/rng/docbook.rng

%.pdf: %.xml
	java -jar ${JING_JAR} ${DOCBOOK_RNG} '$^'
	./optimize-char-spacing.py '$^' tmp-'$^'
	java -jar ${JING_JAR} ${DOCBOOK_RNG} tmp-'$^'
	xsltproc -o '$^'.fo fo.xsl tmp-'$^'
	fop -q -c fop.xconf '$^'.fo $@ >/dev/null 2>&1
	rm -f tmp-'$^' '$^'.fo

%.html: %.xml html.xsl
	./optimize-char-spacing.py $< | xsltproc -o $@ html.xsl -

.PHONY: all html clean

clean:
	rm -f ${PDFS} ${HTMLS}
