# Maintainer: kfgz <kfgz at interia pl>

pkgname=fhourstones
pkgver=3.1
pkgrel=1
pkgdesc="Integer benchmark that solves positions in the game of connect-4, as played on a vertical 7x6 board"
arch=('i686' 'x86_64')
url="http://homepages.cwi.nl/~tromp/c4/fhour.html"
license=('custom')
source=(http://homepages.cwi.nl/~tromp/c4/Fhourstones.tar.gz fhtest)
md5sums=('020cc5476aba44e4abf343e63fd47fca' '086a22a67178e4fdb1431fa044580755')

build() {
  cd ${srcdir}
  sed -i "s/O3/O2/g" Makefile
  make
}

package() {
  cd ${srcdir}
  install -m755 -D SearchGame ${pkgdir}/usr/bin/searchgame
  install -m644 -D inputs ${pkgdir}/usr/share/${pkgname}/inputs
  cd ..
  install -m755 -D fhtest ${pkgdir}/usr/bin/fhtest
}
