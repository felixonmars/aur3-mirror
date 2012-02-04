# Contributor: Bob Fanger <bfanger at gmail>

pkgname=tnef-plugin
pkgver=0.0.0
pkgrel=1
pkgdesc="A simple tnef decoder for Evolution"
arch=('x86_64' 'i686')
url="http://www.go-evolution.org/Tnef"
license=('GPL')
depends=('ytnef')
makedepends=()
install=
source=(http://users.on.net/~notzed/src/$pkgname-$pkgver.tar.gz)
md5sums=('86c18a23db223ea69dba8981a732fe78')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  sed "s/evolution-plugin-2.4/evolution-plugin/" -i.org configure
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}

# vim:set ts=2 sw=2 et:
