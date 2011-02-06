# $Id: PKGBUILD 95264 2010-10-17 20:54:32Z ibiru $
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=curl-fb
pkgver=7.21.2
pkgrel=2
pkgdesc="An URL retrival utility and library (for HipHop compiler)"
arch=('i686' 'x86_64')
url="http://curl.haxx.se"
license=('MIT')
depends=('zlib' 'openssl' 'bash' 'ca-certificates')
options=('!libtool')
provides=(curl)
source=(http://curl.haxx.se/download/curl-${pkgver}.tar.bz2
        curlbuild.h
	libcurl.fb-changes.diff)
md5sums=('ca96df88e044c7c25d19692ec8b250b2'
         '751bd433ede935c8fae727377625a8ae'
	 '8076a8b78cf512a8a738338ee21a8d22')

[[ $CARCH == "x86_64" ]] && _curlbuild=curlbuild-64.h
[[ $CARCH == "i686" ]] && _curlbuild=curlbuild-32.h
build() {
    cd ${srcdir}/curl-${pkgver}
    patch -Np1 -i ../libcurl.fb-changes.diff
    ./configure \
        --with-random=/dev/urandom \
        --prefix=/usr \
        --mandir=/usr/share/man \
        --disable-dependency-tracking \
        --enable-ipv6 \
        --disable-ldaps \
        --disable-ldap \
        --enable-manual \
        --enable-versioned-symbols \
        --with-ca-path=/etc/ssl/certs \
        --without-libidn
    make
}

package() {
    cd ${srcdir}/curl-${pkgver}

    make DESTDIR=${pkgdir} install
    install -Dm644 COPYING \
        ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
    install -Dm644 docs/libcurl/libcurl.m4 \
        ${pkgdir}/usr/share/aclocal/libcurl.m4
    mv "${pkgdir}/usr/include/curl/curlbuild.h" "${pkgdir}/usr/include/curl/${_curlbuild}"
    install -m 644 ${srcdir}/curlbuild.h "${pkgdir}/usr/include/curl/curlbuild.h"
}
