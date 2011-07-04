# 

pkgname=curl-hardened
pkgver=7.21.7
pkgrel=2
pkgdesc="An URL retrival utility and library"
arch=('i686' 'x86_64')
url="http://curl.haxx.se"
license=('MIT')
depends=('zlib' 'openssl-hardened=1.0.0.d' 'bash' 'ca-certificates' 'libssh2')
options=('!libtool')
makedepends=('hardened-cc-aur')
replaces=('curl<=7.21.7-1')
conflicts=('curl=>7.21.7-1')
provides=('curl=7.21.7-1')

source=(http://curl.haxx.se/download/curl-${pkgver}.tar.bz2
        curlbuild.h)

[[ $CARCH == "x86_64" ]] && _curlbuild=curlbuild-64.h
[[ $CARCH == "i686" ]] && _curlbuild=curlbuild-32.h
md5sums=('5f6d50c4d4ee38c57fe37e3cff75adbd'
         '751bd433ede935c8fae727377625a8ae')



build() {
    pkgname="curl"

export CC="/opt/usr/bin/hardened-cc-aur"
export CXX="/opt/usr/bin/hardened-c++-aur"

    cd ${srcdir}/${pkgname}-${pkgver}

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
        --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
        --without-libidn \
        --enable-threaded-resolver
    make
}

package() {
    pkgname="curl"
    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="$pkgdir" install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 docs/libcurl/libcurl.m4 \
        "$pkgdir/usr/share/aclocal/libcurl.m4"
    mv "$pkgdir/usr/include/curl/curlbuild.h" "$pkgdir/usr/include/curl/$_curlbuild"
    install -m644 "$srcdir/curlbuild.h" "$pkgdir/usr/include/curl/curlbuild.h"
pkgname="curl-hardened"
}
