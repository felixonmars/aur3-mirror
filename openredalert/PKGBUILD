# Contributor: Alexander Minges <athemis at ish dot de>
pkgname=openredalert
pkgver=r462
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Westwood Red Alert game engine"
url="http://www.ohloh.net/projects/openredalert"
license=('GPL')
depends=('sdl' 'sdl_mixer')
makedepends=('make')
provides=('openredalert_bin')
source=( http://downloads.sourceforge.net/sourceforge/openredalert/$pkgname-$pkgver-src.tar.gz openredalert.sh)
install=('openredalert.install')
md5sums=('37501829e76e5cc4775352ae36ab906e'\
	 'e3de4c227a868722f40fc6ccfd574ffc')

build() {
  cd $startdir/src/$pkgname
  make VERBOSE=1 || return 1
  mkdir -p $pkgdir/usr/share/openredalert/data/settings/{ra,} $pkgdir/usr/share/openredalert/data/mix $pkgdir/usr/bin
  cp $startdir/src/openredalert.sh $pkgdir/usr/bin/openredalert
  chmod 755 $pkgdir/usr/bin/openredalert
  install -D -m 644 bin/data/settings/* $pkgdir/usr/share/openredalert/data/settings
  install -D -m 644 bin/data/settings/ra/* $pkgdir/usr/share/openredalert/data/settings/ra
  install -D -m 755 bin/openredalert $pkgdir/usr/share/openredalert/openredalert
}
