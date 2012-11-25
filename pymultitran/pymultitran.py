#!/usr/bin/env python3

"""
Copyright (c) 2010, Dmitry
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1) Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
2) Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
3) Neither the name of the author nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
"""

REMOTE_ENCODING = "cp1251"

DEFAULT_COLOUR = "\x1b[0;0m"
GREY_COLOUR = "\x1b[0;37;m"

BAR_COLOUR = DEFAULT_COLOUR
MEANING_COLOUR = "\x1b[3;32m"
SYNONYM_COLOUR = "\x1b[0;0m"
WORD_COLOUR = "\x1b[1m"
PARTICLE_COLOUR = "\x1b[0;36m"

from sys import argv, exit
from urllib.request import urlopen
from urllib.parse import urlencode

class TruncationException(Exception):
    def __init__(self, value):
        self.value = value
    def __str__(self):
        return repr(self.value)

def ltrunc( page, sub ):

    pos = page.lower().find(sub.lower())
    if pos < 0:
        raise TruncationException("Necessary html sequence is not found.")

    return page[pos + len(sub):]

def remove_crap( page ):

    page = ltrunc(page, """document.translation.s.select()\r\ndocument.translation.s.focus()""")

    endsign = """|<span STYLE="color:black">&nbsp;<a href="#start"><FONT SIZE=2>в начало</FONT></a></td></tr></table>"""
    end = page.find(endsign)

    page = page[:end]

    return page

def read_meanings( page ):

    first = True

    while 1:
        try:
            page = ltrunc(page, "<td bgcolor=\"#DBDBDB\" colspan=\"2\" width=\"700\"> <a href=\"")
            page = ltrunc(page, "\">")

            word = page[:page.find("</a>")]

            page = ltrunc(page, "<em>")

            particle_type = page[:page.find("</em>")]

            if first:
                first = False
            else:
                print("")

            print("%s=== %s%s %s(%s%s%s) ===" % (BAR_COLOUR,
                                                 WORD_COLOUR, word,
                                                 BAR_COLOUR,
                                                 PARTICLE_COLOUR, particle_type,
                                                 BAR_COLOUR))

        except TruncationException:
            pass

        try:
            page = ltrunc(page, "<td >  <a title=\"")
        except TruncationException:
            break

        page = ltrunc(page, "<i>")

        closing_pos = page.find("</i>")
        meaning_type = page[:closing_pos]

        synonym_words = []

        page = ltrunc(page, "</i> </a>\r\n</td>")


        while 1:
            page = ltrunc(page, "<a href=\"m.exe?t=")
            page = ltrunc(page, "\">")

            synonym_words.append(page[:page.find("<")])

            page = ltrunc(page, "</a>")

            if page[0] != ";":
                break

        print(" %s%8s  %s%s" % (MEANING_COLOUR, meaning_type,
                                SYNONYM_COLOUR, ", ".join(synonym_words)))

if len(argv) < 2:
    print("Usage: %s word" % argv[0])
    exit(1)

word = argv[1]

args = urlencode([("l1", "1"), ("l2", "2"), ("s", word)],
                 encoding = REMOTE_ENCODING)
fp = urlopen('http://www.multitran.ru/c/m.exe?%s' % args)

page = fp.read().decode(REMOTE_ENCODING)

page = remove_crap(page)
page = page.replace("&nbsp;", " ")
page = page.replace("<span STYLE=&#34;color:gray&#34;>", GREY_COLOUR)
page = page.replace("<span STYLE=&#34;color:black&#34;>", DEFAULT_COLOUR)
read_meanings(page)
