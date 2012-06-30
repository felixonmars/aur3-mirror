# $Id: PKGBUILD 66918 2012-03-01 15:51:48Z bluewind $
# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_pkgbasename=sdl-joypatch
pkgname=lib32-$_pkgbasename
pkgver=1.2.15
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (32-bit). Added a fix for some joysticks where the left/right axis didn't respond."
arch=('x86_64')
url="http://www.libsdl.org"
license=('LGPL')
depends=('lib32-libxext' 'lib32-libxrender' 'lib32-libx11' $_pkgbasename)
makedepends=('lib32-alsa-lib' 'lib32-mesa' 'lib32-libpulse' gcc-multilib)
provides=('lib32-sdl=1.2.15')
conflicts=('lib32-sdl')
options=('!libtool')
source=(http://www.libsdl.org/release/SDL-${pkgver}.tar.gz
        sdl-1.2.14-fix-mouse-clicking.patch
        SDL-1.2.15-joystick.patch 
        )
md5sums=('9d96df8417572a2afb781a7c4c811a85'
         '04d8c179f125e04bcd4c9d60e013c2d7'
         '9cb0cd74b0f39da21cd37258870b6e52'
        )

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${srcdir}/SDL-${pkgver}
  patch -Np1 -i $srcdir/sdl-1.2.14-fix-mouse-clicking.patch
  patch -Np1 -i $srcdir/SDL-1.2.15-joystick.patch 
  ./configure --prefix=/usr --disable-nasm --enable-alsa \
              --with-x --disable-rpath --libdir=/usr/lib32 --disable-static
  make
}

package() {
  cd ${srcdir}/SDL-${pkgver}
  make DESTDIR=${pkgdir} install

  rm -rf "${pkgdir}"/usr/{include,share}

  cd "$pkgdir/usr/bin"
  mv sdl-config sdl-config-32
}
