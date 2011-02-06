#Maintainer: Jakub Nawalaniec <pielgrzym@prymityw.pl>
pkgname=lib32-libcnbj
pkgver=2.5
pkgrel=1
pkgdesc="32bit port of library to use canon pixus ip3100/ip4100/ip8600 and pixma ip1000/ip1500"
arch=('x86_64')
url="http://mambo.kuhp.kyoto-u.ac.jp/~takushi"
license=('GPL')
source=(http://mambo.kuhp.kyoto-u.ac.jp/~takushi/debian/${pkgname/lib32-/}-${pkgver}\_0.orig.tar.gz)
md5sums=(10028f8707917149e0cd3e5ca4a0d74c)

build() {
  cd $startdir/src/libcnbj-2.5-0.orig/libs
  mkdir -p $pkgdir/opt/lib32/usr/lib
  cp -p lib* $pkgdir/opt/lib32/usr/lib
  cp -p -R bjlib $pkgdir/opt/lib32/usr/lib/
}
