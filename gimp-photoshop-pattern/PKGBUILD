# Contributor: maz-1 <loveayawaka(at)gmail(dot)com>

pkgname=gimp-photoshop-pattern
pkgver=1.0
pkgrel=1
pkgdesc="A Gimp plugin for loading photoshop patterns"
url="http://registry.gimp.org/node/10879"
arch=('i686' 'x86_64')
license=("GPL")
depends=('gimp')
makedepends=('pkgconfig')
source=(http://registry.gimp.org/files/ps-pat-load_1.c)
md5sums=('71cd46ad24e8daa1c51f1a31fceb0408')

build() {
  cd $startdir/src
  gimptool-2.0 --build ps-pat-load_1.c
  
}
package() {
 install -D -m 755 ./ps-pat-load_1 $startdir/pkg/usr/lib/gimp/2.0/plug-ins/ps-pat-load || return 1
}
