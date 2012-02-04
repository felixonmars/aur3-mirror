# Contributor: Corrado Primier <bardo@aur.archlinux.org>
pkgname=sigx
pkgver=2.0.2
pkgrel=1
pkgdesc="An interthread communication library for c++"
arch=('i686' 'x86_64')
url="http://triendl.eu/sigx/"
license=('GPL')
depends=('glibmm')
makedepends=('scons')
source=(http://triendl.eu/sigx/${pkgname}-${pkgver}.tar.bz2)
md5sums=('a920c75e5016b5f27a5be2e5f5483a62')

build() {
  cd "${srcdir}/${pkgname}"

  scons DESTDIR="${pkgdir}/" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
