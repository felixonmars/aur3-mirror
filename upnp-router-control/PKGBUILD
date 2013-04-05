# Maintainer: Gionn <me[at]gionn[dot]net>
pkgname=upnp-router-control
pkgver=0.2
pkgrel=2
pkgdesc="UPnP Router Control allow to see some params of the router like the download speed and control port forwarding trough UPnP protocol."
url="https://launchpad.net/upnp-router-control"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('gtk2' 'gupnp' 'curl')
optdepends=()
makedepends=('intltool')
conflicts=()
replaces=()
backup=()
source=("http://launchpad.net/upnp-router-control/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
sha512sums=('58811b41750e85e4fa20c7397fc9c539630cf8bed49f84df44dd3e8439cb238425a46a0f1d66d12693db30bfb8ca522655865c5ff2d6749f71252dfeb2be17dc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g' configure.ac
  sed -i 's/AM_PROG_CC_STDC/AC_PROG_CC/g' configure.ac
  ./autogen.sh
  ./configure --prefix=/usr
  make CFLAGS="$CFLAGS -lm"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
