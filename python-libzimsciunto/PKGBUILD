# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-libzimsciunto
pkgver=0.3
pkgrel=1
pkgdesc="Library for Sciunto's zim tools"
arch=('any')
url="https://github.com/sciunto/libZimSciunto"
license=('LGPL3')
depends=('python')
source=(https://github.com/downloads/sciunto/libZimSciunto/libZimSciunto-${pkgver}.tar.bz2)
md5sums=("845960bd48f7c770444dbd6fccde5dd4")

build() {
  cd "${srcdir}"
  python3 setup.py install --root="${pkgdir}"
}

# vim:ts=2:sw=2:et:
