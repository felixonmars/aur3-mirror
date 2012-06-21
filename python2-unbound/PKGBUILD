# $Id: PKGBUILD 71115 2012-05-24 13:42:42Z bisson $
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Hisato Tatekura <hisato_tatekura@excentrics.net>
# Contributor: Massimiliano Torromeo <massimiliano DOT torromeo AT google mail service>

pkgname=python2-unbound
pkgver=1.4.17
pkgrel=1
pkgdesc='Validating, recursive, and caching DNS resolver: python2 binding'
url='http://unbound.net/'
license=('custom:BSD')
arch=('i686' 'x86_64')
options=('!libtool')
depends=('python2' 'unbound' 'openssl')
makedepends=('expat' 'swig' 'openssl')
optdepends=('expat: unbound-anchor')
_basename='unbound'
source=("http://unbound.net/downloads/${_basename}-${pkgver}.tar.gz")
sha1sums=('fea4d812c03af4737ef671ac30b7b7400d346516')

build() {
	cd "${srcdir}/${_basename}-${pkgver}"

	PYTHON=/usr/bin/python2 ./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--enable-static=no \
		--disable-rpath \
		--with-conf-file=/etc/unbound/unbound.conf \
		--with-pidfile=/var/run/unbound.pid \
        --with-pyunbound

	make
}

package() {
	cd "${srcdir}/${_basename}-${pkgver}"

	make DESTDIR="${pkgdir}" install

    rm -r "${pkgdir}/etc"
    rm -r "${pkgdir}/usr/sbin"
    rm -r "${pkgdir}/usr/include"
    rm -r "${pkgdir}/usr/share"
    rm -r "${pkgdir}/usr/lib/libunbound.la"
    rm -r "${pkgdir}/usr/lib/libunbound.so"
    rm -r "${pkgdir}/usr/lib/libunbound.so.2"
    rm -r "${pkgdir}/usr/lib/libunbound.so.2.1.1"

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
