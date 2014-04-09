#!/usr/bin/env python

"""
Command line tool to print a file, highlighting
differences between lines
"""

import sys
import difflib
import optparse

TAGS = ("replace", "delete", "insert")

START_COLOUR = '\033[33m'
END_COLOUR = '\033[0m'

def print_line(line, ops):
    """
    Print a line, highlighting changes
    """

    open_tags = set()

    for index, char in enumerate(line):
        starts = {tag for tag, a, b in ops if a == index and tag in TAGS}
        ends = {tag for tag, a, b in ops if b == index and tag in TAGS}

        open_tags.update(starts)

        sys.stdout.write(START_COLOUR * len(starts))

        sys.stdout.write(char)

        open_tags.difference_update(ends)

        if not open_tags:
            sys.stdout.write(END_COLOUR)

def main():
    """
    Open the supplied file and print each line, highlighting differences
    """

    parser = optparse.OptionParser("usage: %prog [options] file")

    parser.add_option("-n", type="float", default=0.75, help="Set similarity threshold (default 0.75)")

    (options, args) = parser.parse_args()

    if len(args) == 0:
        parser.print_help()
        sys.exit(1)

    if len(args) != 1:
        parser.error("need to specify a file")

    threshold = options.n

    with open(args[0]) as logfile:
        lines = list(logfile)

        line = ""
        last_ops = []

        for index, line in enumerate(lines):
            if index > 0:
                last_line = lines[index - 1]

                matcher = difflib.SequenceMatcher(None, last_line, line)

                if matcher.quick_ratio() < threshold:
                    print_line(last_line, last_ops)
                    last_ops = []

                else:
                    ops = matcher.get_opcodes()

                    last_line_ops = last_ops + [(tag, i1, i2) for (tag, i1, i2, j1, j2) in ops]
                    this_line_ops = [(tag, j1, j2) for (tag, i1, i2, j1, j2) in ops]

                    print_line(last_line, last_line_ops)

                    last_ops = this_line_ops

        print_line(line, last_ops)

if __name__ == '__main__':
    main()
