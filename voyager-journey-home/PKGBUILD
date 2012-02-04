#Maintainer: Joel Heaton <jheaton at archlinux dot us>
pkgname=voyager-journey-home
pkgver=0.1
pkgrel=1
pkgdesc="Side-scrolling space shooter based on Star Trek: Voyager"
arch=('i686' 'x86_64')
url="http://sandbox.ltmnet.com/voyager"
license=('GPL3')
depends=('sdl' 'sdl_mixer' 'sdl_image' 'sdl_ttf')
source=("http://sandbox.ltmnet.com/files/downloads/all/voyager/voyager.tar.bz2"
        voyager
        voyager.install)
install=voyager.install
md5sums=('b5f939435e847a4c714b6e44e5c07964'
         'ae30f3d919951400a507898e0466f69f'
         'dca51e28db5fa18874592deb781536a3')

build() {
  cd $srcdir/voyager
  make
}

package() {
  cd $srcdir/voyager
  mkdir -p $pkgdir/opt
  mkdir -p $pkgdir/usr/bin
  sed -i 's|PREFIX=/usr/games|PREFIX=$(DESTDIR)/opt|' Makefile.inc
  sed -i '/@touch/,/@chmod/d' Makefile
  make DESTDIR=$pkgdir install
  cd ../..
  cp voyager $pkgdir/usr/bin
}
