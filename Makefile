XMLS=\
	haskell-programming-environment.xml \
	haskell-programming-language.xml \
	linux-application-development.xml \
	linux-desktop.xml

.PHONY: all clean html pdf

all: html pdf

html: $(XMLS:xml=html)

pdf: $(XMLS:xml=pdf)

%.pdf: %.xml
	python3 transform.py fo.xsl $< - | fop -c fop.xconf - $@

%.html: %.xml
	python3 transform.py html.xsl $< $@

clean:
	rm -f $(XMLS:xml=html) $(XMLS:xml=pdf)
