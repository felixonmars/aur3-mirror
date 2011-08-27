# Contributor: sh__
# Contributions by beniro and Snowman

pkgname=mupen64
pkgver=0.5
pkgrel=5
pkgdesc="A Nintendo 64 emulator" 
arch=('i686')
url="http://mupen64.emulation64.com/"
license="GPL"
makedepends=('pkgconfig')
depends=('gtk2' 'sdl' 'libgl' 'libstdc++5')
source=(http://mupen64.emulation64.com/files/0.5/$pkgname\_src-$pkgver.tar.bz2\
        mupen.config mupenpatch4.diff) 
md5sums=('11f994bed40e00fad5b82333b553e421'\
         '2cd713947e8295a34cf2e473cc14a19e'\
         '527a29b0c178266f95e56c0a808b8d81')

build() {
  cd $startdir/src/$pkgname\_src-$pkgver
  patch -Np1 -i ../mupenpatch4.diff
  cp ../mupen.config ./config.h
  sed -i -e "s:-mcpu=athlon:-march=native:" Makefile
  make clean all || return 1
  install -d $startdir/pkg/usr/{bin,share/mupen64}
  make PREFIX=$startdir/pkg/usr/ install
  chmod a+r $startdir/pkg/usr/share/mupen64/lang/*
  rm -rf $startdir/pkg/usr/share/$pkgname/doc
}
