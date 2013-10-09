pkgname=fpc32-pascaltz
pkgver=1.0
pkgrel=1
pkgdesc="It allows you to convert local times to GMT/UTC/Zulu and across time zones taking in account the different rules for this change on every time zone. (multilib)"
url="http://wiki.freepascal.org/PascalTZ"
license=("custom:LGPL")
arch=(x86_64)
makedepends=(fpc-multilib dos2unix)
depends=(tzdata)
source=("http://downloads.sourceforge.net/lazarus-ccr/pascaltz.zip")
sha1sums=('b20e32d6e605d8d7b71e5614a781e75ff7006b10')
_fpcver=`fpc -iV`

prepare() {
	cd ${srcdir}
	find . -type f -exec dos2unix {} \;
}

build() {
  cd ${srcdir}
  for file in `ls *.pas`
  do
    ppcross386 -Tlinux -O3 -Xs -XX $file
  done
}

package() {
  cd ${srcdir}
  find . -name '*.o' -o -name '*.ppu' -o -name '*.rst' -o -name '*.a'|
    xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/fpc/$_fpcver/units/i386-linux/pascaltz/"{}
}
