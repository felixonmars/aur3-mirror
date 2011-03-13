#! /usr/bin/env python
# -*- coding: iso-8859-1 -*-
# Written by Martin v. Loewis <loewis@informatik.hu-berlin.de>
#
# Changed by Christian 'Tiran' Heimes <tiran@cheimes.de> for the placeless
# translation service (PTS) of Zope
#
# Fixed some bugs and updated to support msgctxt
# by Hanno Schlichting <hanno@hannosch.info>

"""Generate binary message catalog from textual translation description.

This program converts a textual Uniforum-style message catalog (.po file) into
a binary GNU catalog (.mo file). This is essentially the same function as the
GNU msgfmt program, however, it is a simpler implementation.

This file was taken from Python-2.3.2/Tools/i18n and altered in several ways.
Now you can simply use it from another python module:

  from msgfmt import Msgfmt
  mo = Msgfmt(po).get()

where po is path to a po file as string, an opened po file ready for reading or
a list of strings (readlines of a po file) and mo is the compiled mo file as
binary string.

Exceptions:

  * IOError if the file couldn't be read

  * msgfmt.PoSyntaxError if the po file has syntax errors

"""
import struct
import array
from cStringIO import StringIO

__version__ = "1.1-pythongettext"

class PoSyntaxError(Exception):
    """ Syntax error in a po file """
    def __init__(self, msg):
        self.msg = msg

    def __str__(self):
        return 'Po file syntax error: %s' % self.msg

class Msgfmt:
    """ """
    def __init__(self, po, name='unknown'):
        self.po = po
        self.name = name
        self.messages = {}
        self.openfile = False

    def readPoData(self):
        """ read po data from self.po and return an iterator """
        output = []
        if isinstance(self.po, str):
            output = open(self.po, 'rb')
        elif isinstance(self.po, file):
            self.po.seek(0)
            self.openfile = True
            output = self.po
        elif isinstance(self.po, list):
            output = self.po
        if not output:
            raise ValueError, "self.po is invalid! %s" % type(self.po)
        return output

    def add(self, context, id, str, fuzzy):
        "Add a non-empty and non-fuzzy translation to the dictionary."
        if str and not fuzzy:
            # The context is put before the id and separated by a EOT char.
            if context:
                id = context + '\x04' + id
            self.messages[id] = str

    def generate(self):
        "Return the generated output."
        keys = self.messages.keys()
        # the keys are sorted in the .mo file
        keys.sort()
        offsets = []
        ids = strs = ''
        for id in keys:
            # For each string, we need size and file offset. Each string is
            # NUL terminated; the NUL does not count into the size.
            offsets.append((len(ids), len(id), len(strs),
                            len(self.messages[id])))
            ids += id + '\0'
            strs += self.messages[id] + '\0'
        output = ''
        # The header is 7 32-bit unsigned integers. We don't use hash tables,
        # so the keys start right after the index tables.
        keystart = 7*4+16*len(keys)
        # and the values start after the keys
        valuestart = keystart + len(ids)
        koffsets = []
        voffsets = []
        # The string table first has the list of keys, then the list of values.
        # Each entry has first the size of the string, then the file offset.
        for o1, l1, o2, l2 in offsets:
            koffsets += [l1, o1+keystart]
            voffsets += [l2, o2+valuestart]
        offsets = koffsets + voffsets
        # Even though we don't use a hashtable, we still set its offset to be
        # binary compatible with the gnu gettext format produced by:
        # msgfmt file.po --no-hash
        output = struct.pack("Iiiiiii",
                             0x950412deL,       # Magic
                             0,                 # Version
                             len(keys),         # # of entries
                             7*4,               # start of key index
                             7*4+len(keys)*8,   # start of value index
                             0, keystart)       # size and offset of hash table
        output += array.array("i", offsets).tostring()
        output += ids
        output += strs
        return output

    def get(self):
        """ """
        self.read()
        # Compute output
        return self.generate()

    def read(self, header_only=False):
        """ """
        ID = 1
        STR = 2
        CTXT = 3

        section = None
        fuzzy = 0
        msgid = msgstr = msgctxt = ''

        # Parse the catalog
        lno = 0
        for l in self.readPoData():
            lno += 1
            # If we get a comment line after a msgstr or a line starting with
            # msgid or msgctxt, this is a new entry
            if section == STR and (l[0] == '#' or (l[0] == 'm' and
               (l.startswith('msgctxt') or l.startswith('msgid')))):

                self.add(msgctxt, msgid, msgstr, fuzzy)
                section = None
                msgctxt = ''
                fuzzy = 0
                # If we only want the header we stop after the first message
                if header_only:
                    break
            # Record a fuzzy mark
            if l[:2] == '#,' and 'fuzzy' in l:
                fuzzy = 1
            # Skip comments
            if l[0] == '#':
                continue
            # Now we are in a msgctxt section
            elif l[0] == 'm':
                if l.startswith('msgctxt'):
                    section = CTXT
                    l = l[7:]
                    msgctxt = ''
                # Now we are in a msgid section, output previous section
                elif l.startswith('msgid'):
                    section = ID
                    l = l[5:]
                    msgid = msgstr = ''
                # Now we are in a msgstr section
                elif l.startswith('msgstr'):
                    section = STR
                    l = l[6:]
            # Skip empty lines
            l = l.strip()
            if not l:
                continue
            # XXX: Does this always follow Python escape semantics?
            try:
                l = eval(l)
            except Exception, msg:
                raise PoSyntaxError('%s (line %d of po file %s): \n%s' % (msg, lno, self.name, l))
            if section == CTXT:
                msgctxt += l
            elif section == ID:
                msgid += l
            elif section == STR:
                msgstr += l
            else:
                raise PoSyntaxError('error in line %d of po file %s' % (lno, self.name))

        # Add last entry
        if section == STR:
            self.add(msgctxt, msgid, msgstr, fuzzy)

        if self.openfile:
            self.po.close()

    def getAsFile(self):
        return StringIO(self.get())
