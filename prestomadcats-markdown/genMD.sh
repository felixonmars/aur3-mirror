#!/bin/bash
echo "<html><head><title>Document</title><style type=\"text/css\">" > $2;
cat /usr/share/madcats-markdown-css/MD.css >> $2
echo "</style></head><body>" >> $2
markdown $1 >> $2;
echo "</body></html>" >> $2;
