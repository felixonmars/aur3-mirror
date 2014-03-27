# Maintainer: Drake Arconis <lightdrake@gmail.com>
# Contributor: Stefano Facchini <stefano.facchini@gmail.com>
pkgname=libosinfo
pkgver=0.2.10
pkgrel=1
pkgdesc="GObject based library API for managing information about operating systems, hypervisors and the (virtual) hardware devices they can support."
arch=('i686' 'x86_64')
url="http://libosinfo.org"
license=('GPL2' 'LGPL2.1')
depends=('glib2' 'gobject-introspection' 'libsoup' 'libxml2' 'libxslt')
makedepends=('vala' 'intltool')
source=(https://fedorahosted.org/releases/l/i/libosinfo/$pkgname-$pkgver.tar.gz)
sha256sums=('564bd487a39dc09a10917c1d7a95f739ee7701d9cd0fbabcacea64f615e20a2d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
	--enable-tests=no

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
