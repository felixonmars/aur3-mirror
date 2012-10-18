# Maintainer : Daniel Wallace < daniel.wallace at gatech dot edu>
# Contributor: Zoran Zaric <zz@zoranzaric.de>

pkgname=python2-fabulous
pkgver=0.1.5
pkgrel=3
pkgdesc='A Python library designed to make the output of terminal applications look fabulous.'
arch=(any)
url='http://lobstertech.com/fabulous.html'
license=('MIT')
makedepends=('python2-distribute')
depends=('python2' 'python2-imaging' 'python2-grapefruit')
conflicts=('python-fabulous')
replaces=('python-fabulous')
source=(http://lobstertech.com/media/file/fabulous/fabulous-${pkgver}.tar.gz)
md5sums=('588088119a65f87517e6cb637c4974fa')

build() {
  cd "${srcdir}/fabulous-${pkgver}"

  python2 setup.py build
}


package() {
  cd "${srcdir}/fabulous-${pkgver}"

  python2 setup.py install --root="${pkgdir}" --optimize=1
}
