# Maintainer: Robson Cardoso dos Santos <cardoso.rcs@gmail.com>

pkgname=projectcenter
pkgver=0.6.0
pkgrel=1
pkgdesc="GNUstep integrated development environment"
arch=(i686 x86_64)
url="http://www.gnustep.org/"
license=('GPL')
depends=('gcc-libs')
source=(http://ftpmain.gnustep.org/pub/gnustep/dev-apps/ProjectCenter-$pkgver.tar.gz)
md5sums=('42627ed627306c9b02589b07c8648c4a')

build() {
  cd $startdir/src/ProjectCenter-$pkgver
      
  make || return 1
  make DESTDIR=$pkgdir install || return 1

# gnustep-back needs to be recompiled against gnustep-gui to work
} 

