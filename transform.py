import lxml.etree

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

        if (prev and not prev.isspace() and not char.isspace()
            and ((isalnum(prev) and ismulti(char))
                 or (ismulti(prev) and isalnum(char)))):
            return res + ' ' + char
        else:
            return res + char

    return functools.reduce(helper, text)

def text_nodes(root):
    if root.nodeType == root.TEXT_NODE:
        return [root]
    elif not root.childNodes:
        return []
    else:
        return functools.reduce(
                operator.add, map(text_nodes, root.childNodes))

def literal_nodes(root):
    return functools.reduce(
        operator.add,
        [root.getElementsByTagName(x)
         for x in ['code', 'literal', 'command', 'link', 'filename',
                   'userinput', 'computeroutput']])

def inline_includes(root):
    for node in root.getElementsByTagName("xi:include"):
        included = xml.dom.minidom.parse(node.getAttribute("href"))
        for child in included.childNodes:
            node.parentNode.insertBefore(child, node)
        node.parentNode.removeChild(node)

if __name__ == '__main__':
    stylesheet, input, output = sys.argv[1:]

    dom = xml.dom.minidom.parse(input)

    inline_includes(dom)

    for node in text_nodes(dom):
        node.data = add_space(node.data)

    for node in literal_nodes(dom):
        p, n = node.previousSibling, node.nextSibling

        if p and p.nodeType == p.TEXT_NODE and not p.data[-1].isspace():
            p.data += ' '

        if n and n.nodeType == node.TEXT_NODE and not n.data[0].isspace():
            n.data = ' ' + n.data

    tree = lxml.etree.fromstring(dom.toxml())

    lxml.etree.RelaxNG(file="docbook/rng/docbook.rng").assertValid(tree)

    result = lxml.etree.tounicode(
        lxml.etree.XSLT(lxml.etree.parse(stylesheet))(tree))

    if output == '-':
        sys.stdout.write(result)
    else:
        open(output, 'w').write(result)
