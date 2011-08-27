# Maintainer: H.Gökhan Sarı <hsa2@difuzyon.net>
pkgname=dict-freedict-eng-tur
pkgver=0.2.1
pkgrel=1
pkgdesc="English-Turkish dictionary for dictd."
arch=(any)
url="http://freedict.org/"
license=('GPL')
depends=('dictd')
#optdepends=()
source=(http://downloads.sourceforge.net/project/freedict/English%20-%20Turkish/$pkgver/freedict-eng-tur-0.2.1.tar.bz2)
md5sums=('294fc4506d9a82a2484b6e0f64fc6607')

build() {
  mkdir -p $pkgdir/usr/share/dictd
  mv $srcdir/eng-tur/eng-tur.dict.dz $pkgdir/usr/share/dictd/
  mv $srcdir/eng-tur/eng-tur.index $pkgdir/usr/share/dictd/
}

# vim:set ts=2 sw=2 et:
