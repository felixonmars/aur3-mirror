# Contributor: Mark Pustjens <pustjens@dds.nl>
# Previous Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Previous Contributor: Giorgio Lando <patroclo7@gmail.com>
# Previous Contributor: Leslie P. Polzer <polzer@gnu.org>
pkgname=isync
pkgver=1.1.1
pkgrel=1
pkgdesc="IMAP mail synchronizer for offline/batch mail editing"
url="http://isync.sourceforge.net/"
arch=(i686 x86_64)
license=(GPL)
depends=(openssl)
source=(http://downloads.sourceforge.net/sourceforge/isync/$pkgname-$pkgver.tar.gz)
sha256sums=('c3a5fdcde1f4627137a0cbb66bebbb12bde4873deb872442be0b1d7a617f7491')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install
}
