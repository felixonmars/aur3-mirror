#!/bin/sh
for name in /usr/share/java/super-postak/*.jar ; do
  CP=$CP:$name
  done
#  In future releases use this to add dependencies  
#  CP=$CP:/usr/share/java/dep1/dep1.jar
    
java -cp ${CP} cz.frantovo.superPostak.SuperPostak $* || exit 1
exit 0
