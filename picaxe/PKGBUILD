# Contributor: Ben Eills <beneills0 A LA googlemail TLD com>
pkgname=picaxe
pkgver=1.0
pkgrel=1
pkgdesc="Utilities to compile/transfer code to the PICAXE range of microcontrollers"
arch=('i686')
url="http://www.rev-ed.co.uk"
license=('proprietary')
source=(http://www.rev-ed.co.uk/software/picaxe.tgz)
md5sums=('cc73050d9a17f343d65825432f2c9d11')

build() {
  cd "$srcdir/"
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin

  mkdir $pkgdir/usr/share
  mkdir $pkgdir/usr/share/man
  mkdir $pkgdir/usr/share/man/man1

  mv $startdir/picaxe.1.gz $pkgdir/usr/share/man/man1

  rm picaxe.xml
  rm picaxe.tgz
  mv * $pkgdir/usr/bin
}
