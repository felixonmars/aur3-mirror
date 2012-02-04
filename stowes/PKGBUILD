#
# Contributor: Andreas Roehrle <andreas_roehrle@yahoo.de>
#

pkgname=stowes
pkgver=0.5.4
pkgrel=1
pkgdesc="Enhancement Script for stow"
arch=('i686')
url="http://os.inf.tu-dresden.de/~adam/stowES/"
license=('GPL')
depends=('perl')
source=(http://os.inf.tu-dresden.de/~adam/stowES/download/stowES-$pkgver.tar.gz)
md5sums=('6b9f3016a1b772455d5df0d6f8185718')

build() {
  cd "$startdir/src/stowES-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
  if [ -d $startdir/pkg/usr/share/doc/stowES ]; then
	  mv $startdir/pkg/usr/share/doc/stowES $startdir/pkg/usr/share/stowES
  fi
}
