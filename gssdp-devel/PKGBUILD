# Contributor: onestep_ua <onestep@ukr.net>
# Contributor: William Diaz <wdiaz@archlinux.us>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=gssdp-devel
pkgver=0.9.2
pkgrel=2
pkgdesc="GSSDP implements resource discovery and announcement over SSDP"
arch=('i686' 'x86_64')
url="http://gupnp.org/"
license=('LGPL')
depends=('libsoup>=2.32.0' 'gtk2>=2.22.0')
makedepends=('gobject-introspection>=0.9.10')
options=('!libtool')
provides=("gssdp=${pkgver}")
conflicts=('gssdp')
source=(http://gupnp.org/sites/all/files/sources/gssdp-${pkgver}.tar.gz)

build() {
  cd "${srcdir}/gssdp-${pkgver}"

  ./configure --prefix=/usr \
      --disable-static \
      --disable-gtk-doc \
      --with-gtk

  make
}

package() {
  cd "${srcdir}/gssdp-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
md5sums=('f60806a6b01748606d20649162bf2b59')
