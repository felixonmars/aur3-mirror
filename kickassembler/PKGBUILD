# Maintainer: Henning Bekel <h.bekel@googlemail.com>

pkgname=kickassembler  
pkgver=3.39
pkgrel=1 
pkgdesc="6510 machine code assembler with integrated scripting language"
url="http://theweb.dk/KickAssembler"
arch=('any')
license=('unknown')
depends=('java-environment')
source=(http://theweb.dk/KickAssembler/KickAssembler.zip kasm.sh)
md5sums=('496bf556878220878782712d010c0f75'
         '307edd51ad16cce238bb36c6350b8ca2')
package() {
  cd $srcdir

  install -D -m644 KickAss.jar $pkgdir/usr/share/kickassembler/KickAss.jar
  install -D -m644 KickAssembler.pdf $pkgdir/usr/share/doc/kickassembler/KickAssembler.pdf
  mkdir $pkgdir/usr/share/doc/kickassembler/examples
  cp -r Examples/* $pkgdir/usr/share/doc/kickassembler/examples/

  install -D -m755 kasm.sh $pkgdir/usr/bin/kasm 
}
