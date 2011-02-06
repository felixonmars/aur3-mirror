# Maintainer: Jan Kokemüller <jan dot kokemueller at gmail dot com>

pkgname=mingw32-intel-tbb
pkgver=3.0_20100915
pkgrel=1
pkgdesc="A library that helps you take advantage of multi-core processor performance."
arch=('i686' 'x86_64')
license=('GPL' 'custom')
url="http://www.threadingbuildingblocks.org/"
depends=('mingw32-runtime')
makedepends=('mingw32-gcc')
options=(!strip)
source=(http://www.threadingbuildingblocks.org/uploads/77/161/3.0%20update%203/tbb${pkgver/\./}oss_src.tgz
        toolchain.patch)
md5sums=('9cf07403ee8c072e87977eb9750146b7'
         '6d8d4d375ad7835123914f1795f6a6af')

build() {
  cd $srcdir/tbb${pkgver/\./}oss
  unset LDFLAGS
  patch -p1 < $startdir/toolchain.patch
  OS=Windows_NT make
}

package() {
  cd $srcdir/tbb${pkgver/\./}oss
  install -d $pkgdir/usr/i486-mingw32/{include,lib}
  install -m755 build/windows*/*.dll $pkgdir/usr/i486-mingw32/lib
  cp -r include/tbb $pkgdir/usr/i486-mingw32/include
  # install license file
  install -Dm644 $srcdir/tbb${pkgver/\./}oss/COPYING \
                 $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
