import lxml.etree

import codecs
import functools
import operator
import string
import sys
import xml.dom.minidom

def add_space(text):
    def isalnum(c):
        return c in (string.digits + string.ascii_letters)

    def ismulti(c):
        return ord(c) > 128

    def helper(res, char):
        prev = res[-1]

        if (prev
                and not prev.isspace()
                and not char.isspace()
                and ((isalnum(prev) and ismulti(char))
                    or (ismulti(prev) and isalnum(char)))):
            return res + ' ' + char
        else:
            return res + char

    return functools.reduce(helper, text)

def all_text_nodes(root):
    if root.nodeType == root.TEXT_NODE:
        return [root]
    elif not root.childNodes:
        return []
    else:
        return functools.reduce(
                operator.add, map(all_text_nodes, root.childNodes))

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: prettify.py in [out]")
        sys.exit(1)

    if len(sys.argv) == 2:
        infile, outfile = sys.argv[1], '-'
    else:
        infile, outfile = sys.argv[1], sys.argv[2]

    doc = xml.dom.minidom.parse(infile)

    for tag in doc.getElementsByTagName("xi:include"):
        sub = xml.dom.minidom.parse(tag.getAttribute("href"))
        parent = tag.parentNode
        for child in sub.childNodes:
            parent.insertBefore(child, tag)
        parent.removeChild(tag)

    for node in all_text_nodes(doc):
        node.data = add_space(node.data)

    literals = functools.reduce(
        operator.add,
        [doc.getElementsByTagName(x)
         for x in ['code', 'literal', 'command', 'link', 'filename',
                   'userinput', 'computeroutput']])

    for item in literals:
        prev = item.previousSibling
        if prev and prev.nodeType == prev.TEXT_NODE:
            if not prev.data[-1].isspace():
                prev.data += ' '

        nxt = item.nextSibling
        if nxt and nxt.nodeType == nxt.TEXT_NODE:
            if not nxt.data[0].isspace():
                nxt.data = ' ' + nxt.data

    rng = lxml.etree.RelaxNG(file="docbook-5.1/rng/docbook.rng")

    rng.assertValid(lxml.etree.fromstring(doc.toxml()))

    if outfile == '-':
        print(doc.toxml())
    else:
        codecs.open(outfile, 'w', 'utf-8').write(doc.toxml())
