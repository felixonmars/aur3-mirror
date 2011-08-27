# Maintainer: Zoran Zaric <zz@zoranzaric.de>

pkgname=python-fabulous
pkgver=0.1.5
pkgrel=2
pkgdesc='A Python library designed to make the output of terminal applications look fabulous.'
arch=(any)
url='http://lobstertech.com/fabulous.html'
license=('MIT')
makedepends=('setuptools')
depends=('python' 'python-imaging' 'python-grapefruit')
source=(http://lobstertech.com/media/file/fabulous/fabulous-${pkgver}.tar.gz)
md5sums=('588088119a65f87517e6cb637c4974fa')

build() {
  cd "${srcdir}/fabulous-${pkgver}"

  python setup.py -q install --root="${pkgdir}" --optimize=1
}
