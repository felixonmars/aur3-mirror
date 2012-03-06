# Maintainer: Nuno Araujo <nuno.araujo at russo79.com>
pkgname=pylibg19
pkgver=0.0.4
pkgrel=1
pkgdesc="Basis for G19 support in Gnome15"
arch=(any)
url="http://www.gnome15.org/"
license=('GPL')
depends=(python2 pyusb python-imaging)
source=(http://www.gnome15.org/downloads/Gnome15/G19/${pkgname}-${pkgver}.tar.gz)
md5sums=('75b685713845b10c0ad4dc4576f3f35a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --prefix='/usr' --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
