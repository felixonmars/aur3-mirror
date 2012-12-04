# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=xmlrpc-c-abyss
pkgver=1.16.44
pkgrel=1
pkgdesc="This library provides a modular implementation of XML-RPC for C and C++"
arch=('i686' 'x86_64')
url="http://xmlrpc-c.sourceforge.net/"
license=('BSD')
depends=('curl' 'libxml2')
makedepends=('libtool')
provides=('xmlrpc-c')
conflicts=('xmlrpc-c')
source=(http://downloads.sourceforge.net/xmlrpc-c/xmlrpc-c-${pkgver}.tgz curl-types-h.patch)
options=('!libtool' '!makeflags')
changelog=${pkgname}.ChangeLog.markdown

build() {
	[ "${CARCH}" = "x86_64" ] && export CFLAGS="${CFLAGS} -fPIC"

	cd $srcdir

	patch -p1 < curl-types-h.patch

	cd xmlrpc-c-$pkgver

	./configure --prefix=/usr \
		--disable-wininet-client \
		--disable-libwww-client \
		--enable-libxml2-backend
	make CFLAGS_PERSONAL="${CFLAGS}"
}

package() {
	cd $srcdir/xmlrpc-c-$pkgver

	make DESTDIR=$pkgdir install
	install -m 644 -D doc/COPYING $pkgdir/usr/share/licenses/${pkgname}/COPYING
}

md5sums=('de3197ef5e1a6dc3265ad407fb1651c6'
         'e01c03956e810e5c24b0aa246dfe70ea')
sha256sums=('359e1f41da5c46cb82eecc042ae215f53571189388ee45c563ed40d7e5deb6f7'
            '2d4c0f60bc407ddca7ef3b771fa47a386035f9908f0de84df775cf8dd61e71f5')
