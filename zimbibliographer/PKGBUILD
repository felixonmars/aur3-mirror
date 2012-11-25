# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=zimbibliographer
pkgver=0.2
pkgrel=1
pkgdesc="Make references in your zim notes via bibtex"
arch=('any')
url="https://github.com/sciunto/ZimBibliographer"
license=('GPL3')
depends=('python' 'python-libzimsciunto')
makedepends=('python-distribute')
source=(https://github.com/downloads/sciunto/ZimBibliographer/ZimBibliographer-${pkgver}.tar.bz2)
md5sums=("807ba0470717022c93153c2c675b035e")

build() {
  cd "${srcdir}"
  python3 setup.py install --root="${pkgdir}"
}

# vim:ts=2:sw=2:et:
