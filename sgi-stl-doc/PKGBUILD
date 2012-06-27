# Maintainer: Tianjiao Yin <ytj000@gmail.com>
pkgname=sgi-stl-doc
pkgver=3.3
pkgrel=1
pkgdesc="Reference and documentation of SGI C++ Standard Template Library."
arch=('any')
url="http://www.sgi.com/tech/stl/"
license=('custom')
source=("http://www.sgi.com/tech/stl/STL_doc.tar.gz")
md5sums=('8b2e047c40bfa18306ebff13e803ed7e')

build() {
  mkdir -p $pkgdir/usr/share/doc
  mv $srcdir/STL_doc $pkgdir/usr/share/doc
}

