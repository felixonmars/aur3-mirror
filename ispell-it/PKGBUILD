# Contributor: rickyc85 <>
pkgname=ispell-it
pkgver=2001
pkgrel=1
pkgdesc="Italian dictionary for ispell."
url="http://members.xoom.alice.it/trasforma/ispell/ispell-it2001.tgz"
depends=('ispell')
source=(http://members.xoom.alice.it/trasforma/ispell/ispell-it2001.tgz)
md5sums=('559ab52451fec91068f11d40f5f919b2')
arch=('i686' 'x86_64')
license=('GPL')

build() {
  cd $startdir/src/ispell-it/
  make || return 1
  mkdir -p "$startdir/pkg/usr/lib/ispell"
  cp "$startdir/src/ispell-it/italian.aff" "$startdir/pkg/usr/lib/ispell/"
  cp "$startdir/src/ispell-it/italian.hash" "$startdir/pkg/usr/lib/ispell/"
}