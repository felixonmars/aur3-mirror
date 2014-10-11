# Maintainer: Cheng Sun <[a single underscore] at chengsun.uk>

pkgname=python2-tiger
pkgver=0.3
pkgrel=2
pkgdesc='A simple implementation of the Tiger cryptographic hash for Python'
arch=('any')
url="http://github.com/MostAwesomeDude/tiger"
license=('GPL3')
depends=('python2')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/t/tiger/tiger-$pkgver.tar.gz)
md5sums=('fbbe588186e5c31ba0af532c39a8ea81')

build() {
  cd ${srcdir}/tiger-${pkgver}
}

package() {
  cd ${srcdir}/tiger-${pkgver}

  # build
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}

# vim:set ts=2 sw=2 et:
