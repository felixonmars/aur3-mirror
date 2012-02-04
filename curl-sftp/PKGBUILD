# Contributor: avogatro <avogatro@gmail.com>

pkgname=curl-sftp
pkgver=7.21.0
pkgrel=1
pkgdesc="An URL retrival utility and library with sftp support"
url="http://curl.haxx.se"
arch=('i686' 'x86_64')
license=('MIT')
depends=('bash' 'ca-certificates' 'zlib' 'openssl>=1.0.0' 'libssh2>=1.2.6' 'libldap' 'libidn')
makedepends=('zlib')
conflicts=('curl')
provides=('curl')
source=("http://curl.haxx.se/download/curl-$pkgver.tar.gz"
	)
sha1sums=('d0e5a1184315b9abb9cc54d77d4a0200526f046d'
)
build() {
  cd $srcdir/curl-$pkgver
  ./configure --prefix=/usr \
  --with-random=/dev/urandom \
  --mandir=/usr/share/man \
  --enable-optimize \
  --enable-http \
  --enable-ftp \
  --enable-file \
  --enable-ldap \
  --enable-ldaps \
  --enable-proxy \
  --enable-ipv6 \
  --enable-thread \
  --enable-crypto-auth \
  --enable-cookies \
  --with-ssl \
  --with-ca-path=/etc/ssl/certs \
  --enable-manual \
  --enable-versioned-symbols \
  --with-libssh2 \
  --with-libidn \
  --enable-debug --enable-curldebug \
  || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  
  install -Dm644 COPYING \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING || return 1
  install -Dm644 docs/libcurl/libcurl.m4 \
          ${pkgdir}/usr/share/aclocal/libcurl.m4 || return 1

}
