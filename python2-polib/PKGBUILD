# Maintainer: Esteban V. Carnevale <alfplayer@mailoo.com>

pkgname=python2-polib
_pkgname='polib'
pkgver=1.0.3
pkgrel=1
pkgdesc='A library to manipulate gettext files'
url='http://polib.readthedocs.org/en/latest/index.html'
arch=('any')
license=('MIT')
depends=('python2')

source=("https://bitbucket.org/izi/polib/downloads/polib-${pkgver}.tar.gz")
md5sums=('dc9dc39d4053cfe030155891f3043cb1')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
