# Maintainer: H.Gökhan Sarı <hsa2@difuzyon.net>
pkgname=dict-freedict-tur-eng
pkgver=0.2.1
pkgrel=1
pkgdesc="Turkish-English dictionary for dictd."
arch=(any)
url="http://freedict.org/"
license=('GPL')
depends=('dictd')
#optdepends=()
source=(http://downloads.sourceforge.net/project/freedict/Turkish%20-%20English/$pkgver/freedict-tur-eng-0.2.1.tar.bz2)
md5sums=('4c6ad6521925415b6d85d622d5f141c3')

build() {
  mkdir -p $pkgdir/usr/share/dictd
  mv $srcdir/tur-eng/tur-eng.dict.dz $pkgdir/usr/share/dictd/
  mv $srcdir/tur-eng/tur-eng.index $pkgdir/usr/share/dictd/
}

# vim:set ts=2 sw=2 et:
