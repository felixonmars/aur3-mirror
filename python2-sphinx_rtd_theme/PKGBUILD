# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Romain Schmitz <slopjong .at. slopjong .dot. de>

pkgname=python2-sphinx_rtd_theme
_pkgname=sphinx_rtd_theme
pkgdesc='Python Sphinx Read The Docs Theme'
pkgver=0.1.6
pkgrel=2
arch=('i686' 'x86_64')
url='https://github.com/snide/sphinx_rtd_theme'
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")

sha256sums=('0f29f544f6d037989fa0c7729a9eab7e4d8ea50d6f0ef37363f472756c1edca6')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 ft=sh et:

