# Maintainer: Zuyi Hu <hzy06880@gmail.com>

pkgname=lib32-isl
_pkgname=isl
pkgver=0.14
pkgrel=1
pkgdesc="Library for manipulating sets and relations of integer points bounded by linear constraints (32-bit)"
arch=('i686' 'x86_64')
url="http://freecode.com/projects/isl"
depends=('lib32-gmp')
license=('MIT')
options=('staticlibs')
source=(http://isl.gforge.inria.fr/$_pkgname-$pkgver.tar.bz2)
md5sums=('acd347243fca5609e3df37dba47fd0bb')


build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr \
  --libdir=/usr/lib32 \
  --includedir=/usr/lib32    \
  --with-gmp-include=/usr/lib32/gmp \
  --with-gmp-lib=/usr/lib32 

  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -dm755 $pkgdir/usr/share/gdb/auto-load/usr/lib32/
  mv $pkgdir/usr/lib32/libisl.so.*-gdb.py $pkgdir/usr/share/gdb/auto-load/usr/lib32/
  
}
