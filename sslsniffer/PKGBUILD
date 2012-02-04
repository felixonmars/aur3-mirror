# Contributor: Pete Morris <pete dot morris at gmail>
pkgname=sslsniffer
pkgver=1.21
pkgrel=1
pkgdesc="A SSLv3/TLS and SSLv2 proxy server that sniffs SSL/TLS packets."
arch=('i686')
url="http://crypto.stanford.edu/~eujin/sslsniffer/"
license=('GPL')
depends=('openssl')
source=(http://crypto.stanford.edu/~eujin/sslsniffer/$pkgname-$pkgver.tar.gz)
md5sums=('8a3b8e72c393d1fffbe1060e834ebfe5')

build() {
  cd "$srcdir/$pkgname"

  make || return 1
  install -D -m755 sslsniffer ${startdir}/pkg/usr/bin/sslsniffer
  install -D -m644 README ${startdir}/pkg/usr/share/${pkgname}/README
}

# vim:set ts=2 sw=2 et:
