# Maintainer: Patrick Hanckmann <hanckmann gmail com>

pkgname=mtconverter
pkgver=0.01
pkgrel=1
pkgdesc="The mtconverter convert files from the MT940 format to the OFX format so that bank transactions can be imported in the GnuCash banking software. Successfully tested with ABNAMRO and GnuCash version 2.2.6 "
arch=('i686' 'x86_64')
url="http://mtconverter.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
source=(http://sourceforge.net/projects/mtconverter/files/mtconverter/Initial%20release/mtconverter-0.01.jar/download)
noextract=(download)
md5sums=('116055e49ea26ba458f23707e7ccd656')

build() {
 mv download mtconverter-0.01.jar
 mkdir -p $pkgdir/usr/share/java/mtconverter
 cp mtconverter-0.01.jar $pkgdir/usr/share/java/mtconverter/ || return 1


 mkdir -p $pkgdir/usr/bin
 echo touch $pkgdir/usr/bin/mtconverter || return 1
 echo '#!/bin/sh' > $pkgdir/usr/bin/mtconverter || return 1
 echo '"$JAVA_HOME/bin/java" -jar /usr/share/java/mtconverter/mtconverter-0.01.jar' >> $pkgdir/usr/bin/mtconverter || return 1
 chmod +x $pkgdir/usr/bin/mtconverter || return 1
}

