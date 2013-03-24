#!/usr/bin/env python
# vim: set fileencoding=utf-8

import re
import os
import sys
import codecs
import string
import operator
import functools
import itertools
from xml.dom import minidom

def add_space(text):
    def isalnum(c):
        return c in (string.digits + string.letters)

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
        print "Usage: convert.py in [out]"
        sys.exit(1)

    if len(sys.argv) == 2:
        infile, outfile = sys.argv[1], '-'
    else:
        infile, outfile = sys.argv[1], sys.argv[2]

    doc = minidom.parse(infile)

    for node in all_text_nodes(doc):
        node.data = add_space(node.data)

    literals = functools.reduce(
                operator.add,
                [doc.getElementsByTagName(x)
                    for x in [
                        'literal', 'command', 'link', 'filename',
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

    if  outfile == '-':
        print doc.toxml().encode('utf-8')
    else:
        codecs.open(outfile, 'w', 'utf-8').write(doc.toxml())
