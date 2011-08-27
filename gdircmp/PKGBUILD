# Contributor: Nathan Owe. ndowens04 at gmail dot com
pkgname=gdircmp
pkgver=0.8
pkgrel=1
pkgdesc="A smiple utility to compare two directories and allows you to select items to copy"
arch=('i686')
url="http://home.hccnet.nl/paul.schuurmans/linux/index.html#xdircmp"
license=('GPL')
depends=('gtk2')
options=(!docs)
source=(http://home.hccnet.nl/paul.schuurmans/linux/download/$pkgname-$pkgver.tar.gz)
md5sums=('b806d75b665a6b30a70537fe194b5a70')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./autogen.sh -prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir/ mandir=$pkgdir/usr/share/man  install
}

# vim:set ts=2 sw=2 et:
