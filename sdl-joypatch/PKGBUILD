# $Id: PKGBUILD 147154 2012-01-23 14:30:05Z heftig $
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=sdl-joypatch
pkgver=1.2.15
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard. Added a fix for some joysticks where the left/right axis didn't respond."
arch=('i686' 'x86_64')
url="http://www.libsdl.org"
license=('LGPL')
depends=('glibc' 'libxext' 'libxrender' 'libx11')
makedepends=('alsa-lib' 'mesa' 'libpulse')
provides=('sdl=1.2.15')
conflicts=('sdl')
options=('!libtool')
source=(http://www.libsdl.org/release/SDL-${pkgver}.tar.gz
        sdl-1.2.14-fix-mouse-clicking.patch
        sdl-1.2.14-disable-mmx.patch
        SDL-1.2.15-joystick.patch)
md5sums=('9d96df8417572a2afb781a7c4c811a85'
         '04d8c179f125e04bcd4c9d60e013c2d7'
         'e5c16b7611f62c7cb25f0534eff68852'
         '9cb0cd74b0f39da21cd37258870b6e52')

build() {
  cd ${srcdir}/SDL-${pkgver}
  patch -Np1 -i $srcdir/sdl-1.2.14-fix-mouse-clicking.patch
  patch -Np1 -i $srcdir/sdl-1.2.14-disable-mmx.patch
  patch -Np1 -i $srcdir/SDL-1.2.15-joystick.patch
  ./configure --prefix=/usr --disable-nasm --enable-alsa --enable-esd \
              --with-x --disable-rpath --disable-static
  make
}

package() {
  cd ${srcdir}/SDL-${pkgver}
  make DESTDIR=${pkgdir} install
}
