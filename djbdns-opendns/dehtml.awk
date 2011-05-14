#dehtml.awk: Removes all HTML tags from file, preliminary to spell check; common
#           ampersand "&entities;" are also resolved into single characters.
#
# Typical use:
#
#   awk -f dehtml.awk infile.html > outfile.txt
#
#   This program is written in the ``awk'' programming language (on Sun systems
# and some others, non-archaic ``awk'' is called ``nawk'', so that ``nawk''
# should be used instead of ``awk'').  Also, a freely-redistributable ``awk''
# interpreter called ``gawk'', which is free of the bugs that some of the
# vendor-supplied ``awk''/``nawk'' programs suffer from, is available for most
# platforms, and as source from the FSF GNU project.
#
# This program processes all files on the command line to STDOUT; to process a
# number of files individually, use the iteration mechanism of your shell; for
# example:
#
#    for a in *.html ; do awk -f dehtml.awk$a > otherdir/$a ; done
#
# in Unix sh, or:
#
#    for %a in (*.htm) do call dehtml %a otherdir\%a
#
# in MS-DOS, where dehtml.bat is the following one-line batch file:
#
#    gawk -f dehtml.awk %1 > %2
#
# Copyright H. Churchyard 1994, 1995 -- freely redistributable.
#
#  Version 1.0 11/27/94 -- Included in htmlchek 3.0 release.
#  Version 1.1 12/6/94 -- Fixed minor bug which could unpredictably cause a
# string such as "&amp;eacute;" to be reduced into a single character;
# added "&shy;".   Included in htmlchek 3.01 release.
#  Version 1.2 1/12/95 -- No error on `>' outside tag; minor bugfix.  Included
# in htmlchek 4.0 release.
#
#This will test the 8-bit-cleanliness of your awk:
BEGIN{
amp["&[\043]32;"]="\040";amp["&nbsp;"]="\040";
amp["&[\043]34;"]="\042";amp["&quot;"]="\042";
amp["&[\043]60;"]="\074";amp["&lt;"]="\074";amp["&[\043]62;"]="\076";
amp["&gt;"]="\076";amp["&Agrave;"]="\300";amp["&Aacute;"]="\301";
amp["&Acirc;"]="\302";amp["&Atilde;"]="\303";amp["&Auml;"]="\304";
amp["&Aring;"]="\305";amp["&AElig;"]="\306";amp["&Ccedil;"]="\307";
amp["&Egrave;"]="\310";amp["&Eacute;"]="\311";amp["&Ecirc;"]="\312";
amp["&Euml;"]="\313";amp["&Igrave;"]="\314";amp["&Iacute;"]="\315";
amp["&Icirc;"]="\316";amp["&Iuml;"]="\317";amp["&ETH;"]="\320";
amp["&Ntilde;"]="\321";amp["&Ograve;"]="\322";amp["&Oacute;"]="\323";
amp["&Ocirc;"]="\324";amp["&Otilde;"]="\325";amp["&Ouml;"]="\326";
amp["&Oslash;"]="\330";amp["&Ugrave;"]="\331";amp["&Uacute;"]="\332";
amp["&Ucirc;"]="\333";amp["&Uuml;"]="\334";amp["&Yacute;"]="\335";
amp["&THORN;"]="\336";amp["&szlig;"]="\337";amp["&agrave;"]="\340";
amp["&aacute;"]="\341";amp["&acirc;"]="\342";amp["&atilde;"]="\343";
amp["&auml;"]="\344";amp["&aring;"]="\345";amp["&aelig;"]="\346";
amp["&ccedil;"]="\347";amp["&egrave;"]="\350";amp["&eacute;"]="\351";
amp["&ecirc;"]="\352";amp["&euml;"]="\353";amp["&igrave;"]="\354";
amp["&iacute;"]="\355";amp["&icirc;"]="\356";amp["&iuml;"]="\357";
amp["&eth;"]="\360";amp["&ntilde;"]="\361";amp["&ograve;"]="\362";
amp["&oacute;"]="\363";amp["&ocirc;"]="\364";amp["&otilde;"]="\365";
amp["&ouml;"]="\366";amp["&oslash;"]="\370";amp["&ugrave;"]="\371";
amp["&uacute;"]="\372";amp["&ucirc;"]="\373";amp["&uuml;"]="\374";
amp["&yacute;"]="\375";amp["&thorn;"]="\376";amp["&yuml;"]="\377";
amp["&reg;"]="\256";amp["&copy;"]="\251";amp["&[\043]163;"]="\243";
amp["&shy;"]="-";
}
#
# Main
#
# Variable ``state'' is one if unresolved `<', zero otherwise.
#
{line="";errstr="";erra=0;errb=0;currsrch=1;txtbeg=1;
 while (match(substr($0,currsrch),/[<>]/)!=0)
      {currsrch=(currsrch+RSTART);
       if (substr($0,(currsrch-1),1)=="<")
         {if (state)
            {if (!erra)
               {errstr=(errstr "&&^Multiple `<' without `>' ERROR!, Ignoring^&&\n");
                erra=1}}
           else {if ((currsrch>length($0))||(substr($0,currsrch,1)~/^[ \t]$/))
                   {if (!errb)
{errstr=(errstr "&&^Whitespace after `<': Bad SGML syntax ERROR!, Ignoring^&&\n");
                       errb=1}}
                  else {if (currsrch>(txtbeg+1))
                          {line=(line substr($0,txtbeg,(currsrch-(txtbeg+1))))};
                        state=1}}}
        else {if (substr($0,(currsrch-1),1)==">")
                {if (state==0)
                   {continue}  #`>' without `<'
                  else {txtbeg=currsrch;state=0;}}
               else {print "Internal error, ignore"}}};
#At EOL:
 if ((!state)&&(txtbeg<=length($0))) {line=(line substr($0,txtbeg))};
 if (line~/&[\043]?[-0-9a-zA-Z.]*;/)
   {for (x in amp) {gsub(x,amp[x],line);if (line!~/&/) {break}};
    gsub(/&([\043]38|amp);/,"\\&",line)};
 if ((line)||((!state)&&($0~/^$/)))
   {if ((!state) || (errstr) || (line~/[ \t]$/))
      {print line}
     else {printf "%s",line}};
 if (errstr) {printf "%s",errstr}}
#
#Minor bug: &g<X>t; will translate to a `>' character!
#
#
END{if (state) {print "&&^Was awaiting a `>' ERROR! at END^&&"}}
##EOF
