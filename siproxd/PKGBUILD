pkgname=siproxd
pkgver=0.8.1
pkgrel=1
pkgdesc="Siproxd is a proxy/masquerading daemon for the SIP protocol"
arch=('i686' 'x86_64')
url="http://siproxd.sourceforge.net/"
license=('GPL')
depends=('libosip2')
makedepends=('autoconf')
backup=('etc/siproxd.conf' 'etc/siproxd_passwd.cfg')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('1a6f9d13aeb2d650375c9a346ac6cbaf')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}" || return 1

	# arch has newer libtool
	autoreconf -f -i || return 1

	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--with-libosip-prefix=/usr/lib \
		--enable-shared \
		--disable-doc \
		--disable-static \
	|| return 1
	make || return 1
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || return 1

	make DESTDIR="$pkgdir" install || return 1

	# we don't need this
	rm -rf "$pkgdir"'/usr/share'
}

