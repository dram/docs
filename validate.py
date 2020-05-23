from lxml import etree

import sys

rng = etree.RelaxNG(file="docbook-5.1/rng/docbook.rng")

doc = etree.parse(open(sys.argv[1]))

rng.assertValid(doc)
