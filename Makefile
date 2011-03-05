#
# Makefile for generating pdf docs
#

PDFS := \
	Linux桌面应用.pdf

%.pdf: %.txt
	./optimize-char-spacing.py '$^' '$^'-tmp
	a2x -f pdf --xsl-file=fo.xsl --fop --fop-opts="-c fop.xconf" '$^'-tmp

all: ${PDFS}

.PHONY: clean

clean:
	rm -f ${PDFS}
