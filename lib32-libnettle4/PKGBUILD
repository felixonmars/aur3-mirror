_pkgname=lib32-nettle
pkgname=lib32-libnettle4
pkgver=2.7.1
_sover=4.7
_hsover=2.5
pkgrel=1
pkgdesc='lib32 nettle4 library (shared objects)'
arch=('x86_64')
url="https://www.lysator.liu.se/~nisse/nettle/"
license=(LGPLv3)
source=("http://seblu.net/a/arm/packages/l/${_pkgname}/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz"{,.sig})
md5sums=('60f94d1a37a8e1065a9f5b47081d5431'
         'SKIP')

package() {
  install -Dm755 $srcdir/usr/lib32/libnettle.so.${_sover} $pkgdir/usr/lib32/libnettle.so.${_sover}
  ln -s libnettle.so.${_sover} $pkgdir/usr/lib32/libnettle.so.4
  install -Dm755 $srcdir/usr/lib32/libhogweed.so.${_hsover} $pkgdir/usr/lib32/libhogweed.so.${_hsover}
  ln -s libhogweed.so.${_hsover} $pkgdir/usr/lib32/libhogweed.so.2
}
