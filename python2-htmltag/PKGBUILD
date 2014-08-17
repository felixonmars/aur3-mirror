# Maintainer: Hong Xu <hong@topbug.net>

pkgname=python2-htmltag
pkgver=1.7
pkgrel=1
pkgdesc="Python HTML tag interface"
license=('Apache')
arch=('i686' 'x86_64')
url="https://github.com/LiftoffSoftware/htmltag"
depends=('python2')
makedepends=('python2-sphinx')
provides=(${pkgname})
source=(https://pypi.python.org/packages/source/h/htmltag/htmltag-${pkgver}.tar.gz)
md5sums=('d3a4b810df9877ebf0239d642ee3c3bb')

build() {
  cd htmltag-${pkgver}
  python2 setup.py build
}

package_python2-htmltag() {
  cd htmltag-${pkgver}
  python2 setup.py install --root="${pkgdir}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
