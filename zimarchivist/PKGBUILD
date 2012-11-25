# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=zimarchivist
pkgver=0.2.6
pkgrel=1
pkgdesc="Make a cache of websites in your zim notes"
arch=('any')
url="https://github.com/sciunto/ZimArchivist"
license=('GPL3')
depends=('python' 'python-beautifulsoup4' 'python-libzimsciunto')
source=(https://github.com/downloads/sciunto/ZimArchivist/ZimArchivist-${pkgver}.tar.bz2)
md5sums=("48aa0c33a7fd53d14d8c87ec9eebd9b1")

build() {
  cd "${srcdir}"
  python3 setup.py install --root="${pkgdir}"
}

# vim:ts=2:sw=2:et:
