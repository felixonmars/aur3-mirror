#!/usr/bin/python2 

# see bottom for license 

from commands import getoutput


def mkaregex(string):
    regex = ''
    a = 0
    for letter in string:
	if a == 0:
	    regex = regex + "^[%c]" % (letter)
	elif a == len(string) - 1:
	    regex = regex + "[%c]$" % (letter)
	else:
	    regex = regex + "[%c]" % (letter)
	a = a + 1
    return regex

def has(what):
    from re import search
    if search(r'^.*-git$', what):
	string1 = ""
    else:
	string1 = "| sed \'/-git/d\'"
    if getoutput("%s %s %s" %("pacman -Qsq", mkaregex(what), string1)) == what:
	return True
    else:
	return False

def lisps_present():
    a = ['']
    if has('clisp'):
	a = a + ['clisp']
    if has('clisp-gtk2'):
	a = a + ['clisp']
    if has('clisp-new-clx'):
	a = a + ['clisp']
    if has('abcl'):
	a = a + ['abcl']
    if has('ccl-bin'):
	a = a + ['ccl-bin']
    if has('xcl'):
	a = a + ['xcl']
    if has('xcl-git'):
	a = a + ['xcl']
    if has('cmucl'):
	a = a + ['cmucl']
    if has('clojure-git'):
	a = a + ['clj']
    if has('clojure'):
	a = a + ['clj']
    if has('gcl'):
	a = a + ['gcl']
    if has('mkcl'):
	a = a + ['mkcl']
    if has('ecl-unicode-git'):
	a = a + ['ecl']
    if has('ecl-unicode'):
	a = a + ['ecl']
    if has('sbcl-git'):
	a = a + ['sbcl']
    if has('sbcl'):
	a = a + ['sbcl']
    if has('ecl'):
	a = a + ['ecl']
    a.remove('') 
    a = a + [''] # added in so that if there aren't any lisp implementations installed, the user can be informed that
#    they need to install one.  
    return a
def haslisp():
    if getoutput("%s %s" %("pacman -Qsq", "^[c][l][i][s][p]$")) == 'clisp': # clisp is the prefered implementation 
	return 'yes, clisp'
    elif getoutput("%s %s" %("pacman -Qsq", "^[s][b][c][l]$")) == 'sbcl':   # sbcl--next best thing, and so on and so forth.  
	return 'yes, sbcl'
    elif getoutput("%s %s" %("pacman -Qsq", "^[e][c][l]$")) == 'ecl':
	return 'yes, ecl'
    elif getoutput("%s %s" %("pacman -Qsq", "^[a][b][c][l]$")) == 'abcl':
	return 'yes, abcl'
    elif getoutput("%s %s" %("pacman -Qsq", "^[c][c][l][-][b][i][n]$")) == 'ccl-bin':
	return 'yes, ccl-bin'
def whichlisp():
    from re import search
    if search(r'yes, ', haslisp()):
	from re import sub 
	return sub(r'[y][e][s][,]\s', '', haslisp())
def main(argv=None):
    if argv is None:
	from sys import argv
    argc = len(argv)
    if argc >= 2:
	return lisps_present()[int(argv[1])]
    else:
	return lisps_present()


if __name__ == '__main__':
    print main()


'''
+--------------------------------------------------------------------------------------+
| BSD-3 OSI License                                                                    |
+--------------------------------------------------------------------------------------+
| Copyright (c) 2013, Alexej G. Magura                                                 |
|                                                                                      |
| All rights reserved.                                                                 |
|                                                                                      |
| Redistribution and use in source and binary forms, with or without                   |
| modification,  are permitted provided that the following conditions are met:         |
|                                                                                      |
| Redistributions of source code must retain the above copyright notice, this          |
| list of conditions and the following disclaimer.                                     |
|                                                                                      |
| Redistributions in binary form must reproduce the above copyright notice,            |
| this list of conditions and the following disclaimer in the documentation            |
| and/or other materials provided with the distribution.                               |
|                                                                                      |
| Neither the name of the owner nor the names of its contributors may                  |
| be used to endorse or promote products derived from this software without            |
| specific prior written permission.                                                   |
|                                                                                      |
| THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"          |
| AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE            |
| IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE           |
| ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE            |
| LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR                  |
| CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF                 |
| SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS             |
| INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN              |
| CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)              |
| ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE           |
| POSSIBILITY OF SUCH DAMAGE.                                                          |
+--------------------------------------------------------------------------------------+
'''

