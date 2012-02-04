# Maintainer: Hans-Kristian Arntzen <maister@archlinux.us>
# Contributor: Hans-Kristian Arntzen <maister@archlinux.us>

pkgname=zsnes-libao
pkgver=1.51
pkgrel=1
pkgdesc="Super Nintendo emulator"
arch=('i686')
license=('GPL')
depends=('gcc-libs' 'sdl' 'libpng' 'libgl' 'ncurses' 'libao')
makedepends=('nasm' 'gcc')
source=(http://zsnes.sourceforge.net/zsnes151bsrc.tar.bz2)
url="http://www.zsnes.com/"
md5sums=('904ee432f378609176ed30c01cf6ea28')

build() {
  

  
  cd ${startdir}/src/zsnes_1_51b/src
  ./autogen.sh --prefix=/usr x_libraries=/usr/lib force_arch=i686 \
               --enable-release --with-x --enable-libao
  
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
