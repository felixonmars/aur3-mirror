# Maintainer: Sebastian Chlan <sebastian.chlan@gmail.com>
# Contributor: Sebastian Chlan <sebastian.chlan@gmail.com>
pkgname=enigma_tec
pkgver=1.5 
pkgrel=1
pkgdesc="Enigma is a simple, Java based application designed to help you simulate the function of the Enigma. It is developed by some students from HTL Rennweg, Vienna."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/enigma-sim/"
license=('GPL')
depends=('java-runtime' 'ttf-ms-fonts')
source=(http://downloads.sourceforge.net/project/enigma-sim/Enigma/Enigma_v1.4.jar http://downloads.sourceforge.net/project/enigma-sim/Sniffer/Sniffer.jar 'enigma_tec.desktop' 'enigma_tec_logo.png' 'enigma_tec_sniffer.desktop')
md5sums=('9b165e59a1eca35e2b9bc456987ad826'
         '289c1ffa8b78a43aebb9f48f11f77584'
         '309270d5f9ba58d847ce572485eafece'
         '376918fd4a89005b2e9e6b9fbfd20ab8'
         '8c9d1fe22aa08aa991b1bbd52984824a')




build() {
 mkdir -p $pkgdir/opt/enigma_tec
 mkdir -p $pkgdir/usr/bin
 mkdir -p $pkgdir/usr/share/applications
 mkdir -p $pkgdir/usr/share/pixmaps/
 msg "Directory created (/opt/enigma_tec)"
 
 mv $startdir/Enigma*.jar $pkgdir/opt/enigma_tec/
 mv $startdir/Sniffer.jar $pkgdir/opt/enigma_tec/
 msg "Binarys copied" 

 cd $pkgdir/usr/bin/
 ___BIN=enigma_tec
 ___BINSNFIFF=enigma_tec_sniffer
 touch $___BIN
 touch $___BINSNFIFF

 echo "#!/bin/bash" > $___BIN
 echo "#!/bin/bash" > $___BINSNFIFF

 echo "java -jar /opt/enigma_tec/Enigma_v1.4.jar &" >> $___BIN
 echo "java -jar /opt/enigma_tec/Sniffer.jar &" >> $___BINSNFIFF
 
 chmod +x $___BIN
 chmod +x $___BINSNFIFF

 msg "Executables created"

 mv $startdir/enigma_tec.desktop $pkgdir/usr/share/applications/
 mv $startdir/enigma_tec_sniffer.desktop $pkgdir/usr/share/applications/
 mv $startdir/enigma_tec_logo.png $pkgdir/usr/share/pixmaps/

 msg "Shortcut installed"
}
