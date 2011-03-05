#!/bin/env python
# vim: set fileencoding=utf-8

import re
import os
import sys
import codecs
import tempfile

def isascii(char):
    if not char:
        return True

    return ord(char) < 255

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print "Usage: convert.py in-file out-file"
        sys.exit(1)

    infile, outfile = sys.argv[1], sys.argv[2]

    out = codecs.open(outfile, "w", "utf-8")

    prev_char = None
    for char in codecs.open(infile, "r", "utf-8").read():
        if isascii(char):
            if not char.isalpha() or isascii(prev_char) or char.isspace():
                out.write(char)
            else:
                out.write(' ' + char)
        else:
            if isascii(prev_char) and prev_char.isalpha() and not prev_char.isspace():
                out.write(' ' + char)
            else:
                out.write(char)
        prev_char = char

    out.close()
