from pyP2B.pyP2Bclass import pyP2B
import os,re,optparse
from accents import latexAccents
import commands

def utf_to_latex(text):
    '''
    Converts utf to latex
    '''
    for search, replace in latexAccents:
         text = text.replace(search, replace)
    return text


def main():
    '''
    Main
    '''
    bibSuccess = False
    
    parser = optparse.OptionParser(usage='%prog [options] inputfile[.tex] <outputfile[.bib]>', version='%prog version 0.1')
    parser.add_option('-m', '--makepdf', action="store_true", default=False, dest='makepdf', help="Execute commands to create an output pdf")
    parser.add_option('-q', '--quiet', action="store_true", default=False, dest='quiet', help="Do not use verbose output")
    (args, opts) = parser.parse_args()
    
    
    (options, args) = parser.parse_args()
    verbose = not options.quiet
    
    if args: 

        try:
            bibname = '%s.bib' % os.path.splitext(args[1])[0]
        except:
            bibname = '%s.bib' % os.path.splitext(args[0])[0]

        try:
            
            basefile = os.path.splitext(args[0])[0]
            texname = '%s.tex' % basefile
            tex = open(texname).read()
            
        except IOError :
            print >>os.sys.stderr, 'Cannot open file %s!' % args[0]
            os.sys.exit(2)
            
        bib = open(bibname, "w")
    
        if verbose: print >>os.sys.stdout, 'Generating bibliography file %s...' % bibname
    
        for m in re.findall("cite\{pmid(\d+)\}", tex):
            myref = pyP2B()

            utf_text = myref.getPubmedReference(m)
            print >>bib, utf_to_latex(utf_text)
        
        bib.close()
        bibSuccess = True
        
    else:
        parser.print_help()

    if bibSuccess and options.makepdf:
        
        output = commands.getoutput('rm %s.aux' % basefile)
        output += commands.getoutput('pdflatex %s' % basefile)
        output += commands.getoutput('bibtex %s' %basefile)
        output += commands.getoutput('pdflatex %s' % basefile)
        output += commands.getoutput('pdflatex %s' % basefile)

        if verbose:
            print >>os.sys.stdout, 'Generating pdf file %s.pdf...' % basefile
            print output

        

if __name__ == "__main__":
    main()
