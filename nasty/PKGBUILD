# Maintainer: Tom Vincent <http://tlvince.com/contact/>
pkgname=nasty
pkgver=0.6
pkgrel=1
pkgdesc="A proof-of-concept PGP/GPG passhphrase recovery program"
arch=(any)
url="http://www.vanheusden.com/nasty/"
license=('GPL')
depends=('gpgme')
source=("http://www.vanheusden.com/nasty/$pkgname-$pkgver.tgz"
        "makefile.patch")
md5sums=('f8181bd8d887acd869ce677034465c6f'
         '49f346219754539e3464e748359ca26f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch < ${srcdir}/makefile.patch
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
