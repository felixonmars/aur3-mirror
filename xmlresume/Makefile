all : resume.html resume.pdf resume.txt

resume.html : resume.xml
	xsltproc -o resume.html /usr/share/xsl/resume/output/us-html.xsl resume.xml

resume.pdf : resume.xml
	fop -pdf resume.pdf -xsl /usr/share/xsl/resume/output/us-letter.xsl -xml resume.xml

resume.txt : resume.xml
	xsltproc -o resume.txt /usr/share/xsl/resume/output/us-text.xsl resume.xml
