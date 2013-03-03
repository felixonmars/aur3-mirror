# Maintainer: Bryan Laur <bjlaur@onymous.org>
# Contributor: Sébastien Leduc <sebastien@sleduc.fr>
# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: Ron Collinson <notthinking at gmail dot com>

pkgname=carrier
pkgver=2.10.1
pkgrel=3
pkgdesc="Pidgin fork providing minor GUI enhancements (formerly funpidgin)"
arch=(i686 x86_64)
license=('GPL2')
url="http://sourceforge.net/projects/funpidgin/"
depends=('startup-notification' 'libidn' 'gtkspell' 'libxss' 'gstreamer0.10' 'nss' 'libsasl' 'python2' 'hicolor-icon-theme' 'libwebkit')
makedepends=('avahi' 'tk' 'ca-certificates' 'intltool')
optdepends=('avahi: Bonjour protocol support'
	    'tk: Tcl/Tk scripting support'
	    'ca-certificates: SSL CA certificates')
conflicts=('pidgin' 'gaim')
provides=('pidgin' 'gaim')
options=(!libtool)
md5sums=('92d246bf75c90a4bbeaea80bad4ab00e')
install=carrier.install
source=("http://downloads.sourceforge.net/sourceforge/funpidgin/$pkgname-$pkgver.tar.bz2")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --disable-perl --disable-nm --disable-vv \
              --disable-schemas-install --disable-meanwhile \
              --enable-cyrus-sasl --disable-doxygen --disable-gnutls \
              --enable-webkit --with-python=/usr/bin/python2 --enable-shared
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=${pkgdir} install

  # Remove GConf schema file
  rm -rf "$pkgdir/etc"
}
# vim:set ts=2 sw=2 et:
