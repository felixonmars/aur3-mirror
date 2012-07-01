# Contributor: Carlo Casta <carlo.casta@gmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=pidgin-extended-blist-sort
pkgver=1.7.1
pkgrel=2
pkgdesc="A plugin for fine-grained sorting of buddy list"
arch=('i686' 'x86_64')
url="https://launchpad.net/pidgin-extended-blist-sort"
license=('GPLv2')
depends=('pidgin')
options=(!libtool)
source=(https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('14b8883dce983cfcd4268538009bf531')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-dependency-tracking
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}