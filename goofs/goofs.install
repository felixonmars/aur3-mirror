#!/bin/sh
post_install() {
	sudo chmod 777 /opt/goofs/goofs-mount.sh
	sudo chmod 777 /usr/bin/goofs-mount
	cat << EOF
============>Configuration
Youm must create a file named ".goofs.properties" in your home folder
add the following 2 properties and save

{{{
username=yourusername@gmail.com
password=yourpassword
}}}

edit the file goofs-mount.sh to define:
  * JAVA_HOME (optionally use a specific jre)
  * GOOFS_HOME (the directory where you install the goofs)
  * JNI_LIB (point it to the specific version of the fuse bindings)

if you want to learn more information,please read the README.txt
EOF
}
post_remove() {
	sudo rm -r -f /opt/goofs
	sudo rm -f /usr/bin/goofs-mount
}
