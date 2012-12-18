# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>

pkgname=truee
pkgver=3.1.1
pkgrel=1
pkgdesc="Time-dependent Regularized Unfolding for Economics and Engineering problems"
arch=('x86_64')
url="http://app.tu-dortmund.de/index.php?option=com_content&view=article&id=141&Itemid=177"
license=('custom')
depends=('root')
makedepends=('cmake')
source=('TRUEE.zip'
        'src.diff'
        'example.diff'
        'truee.conf')

build() {
  cd "$srcdir/TRUEE"
  patch -p0 -i ../src.diff
  patch -p0 -i ../example.diff
  cd build
  ROOTSYS=/usr cmake ..
  make
  cd ../example/build
  ROOTSYS=/usr TRUEE_BUILD="$srcdir/TRUEE/build" cmake ..
  make
}

package() {
  cd "$srcdir/TRUEE"
  mkdir -p "$pkgdir/usr/"{bin,include/truee,share/{licenses/,}truee,lib/truee} "$pkgdir/etc/ld.so.conf.d"
  cp build/lib/* "$pkgdir/usr/lib/truee"
  cp build/include/* "$pkgdir/usr/include/truee"
  cp example/build/bin/truee "$pkgdir/usr/bin"
  cp example/build/bin/*.config "$pkgdir/usr/share/truee"
  cp COPYING "$pkgdir/usr/share/licenses/truee"
  cp "$srcdir/truee.conf" "$pkgdir/etc/ld.so.conf.d"
}

md5sums=('ef00be0e955792edaa841c4589a7da91'
         'fc55ed50641503de3365edf90029e741'
         '9bc88a3be54bf79c46dd7b16df2cea4d'
         '006f2cdc68a622fff5dc2dbc10d3c51a')
