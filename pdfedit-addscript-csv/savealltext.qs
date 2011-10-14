// Console: savealltext
// Description: savealltext input file
// Parameters: [input file] [output file]
/*
 * PDFedit - free program for PDF document manipulation.
 * Copyright (C) 2006-2009  PDFedit team: Michal Hocko,
 *                                        Jozef Misutka,
 *                                        Martin Petricek
 *                   Former team members: Miroslav Jahoda
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 2 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program (in doc/LICENSE.GPL); if not, write to the 
 * Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, 
 * MA  02111-1307  USA
 *
 * Project is hosted on http://sourceforge.net/projects/pdfedit
 */

/** Print help for savealltext */
function savealltext_help() {
 print(tr("Usage:"));
 print("savealltext ["+tr("input file")+"] ["+tr("output file")+"]");
 print(" "+tr("Input file must exist"));
 print(" "+tr("Output file must not exist"));
 exit(1);
}

function savealltext_fail(err) {
 print(tr("savealltext failed!"));
 print(err);
 exit(2);
}

function saveAsText_save(p,f) {
 document=loadPdf(p)
 qs="";
 pages=document.getPageCount();
 for (i=1;i<=pages;i++) {
  pg=document.getPage(i);
  text=pg.getText();
  qs+=text;
  qs+="\n";
 }
 saveFile(f,qs);
}

p=parameters();
if (p.length!=2) {
 savealltext_help("savealltext "+tr("is expecting two parameters"));
}
inFile=p[0];
outFile=p[1];
if (!exists(inFile)) savealltext_fail(tr("Input file '%1' does not exist").arg(inFile));
if (exists(outFile)) savealltext_fail(tr("Output file '%1' already exist").arg(outFile));
if (inFile==outFile) savealltext_fail(tr("Input and output files must be different"));
if (saveAsText_save(inFile,outFile)) {
} else {
 print(tr("savealltext")+" :"+inFile+" -> "+outFile);
}
