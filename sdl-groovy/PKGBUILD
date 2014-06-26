# Maintainer: Matthew Coulson <jmcoulson@gmail.com>

pkgname=sdl-groovy
pkgver=1.2.15
pkgrel=7
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard. Patched for low resolution CRT displays"
arch=('i686' 'x86_64')
url="http://www.libsdl.org"
license=('LGPL')
depends=('glibc' 'libxext' 'libxrender' 'libx11')
conflicts=('sdl')
provides=('sdl=1.2.15')
makedepends=('alsa-lib' 'mesa' 'libpulse' 'glu')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver')
options=('staticlibs')
source=(http://www.libsdl.org/release/SDL-${pkgver}.tar.gz
        sdl-1.2.14-fix-mouse-clicking.patch
        sdl-1.2.14-disable-mmx.patch
        fix_joystick_misc_axes.diff
        libsdl-1.2.15-resizing.patch
        sdl_x11sym.patch
        X11_KeyToUnicode.patch
        1xrand.diff
        1sdl_changeres.diff)
md5sums=('9d96df8417572a2afb781a7c4c811a85'
         '04d8c179f125e04bcd4c9d60e013c2d7'
         'e5c16b7611f62c7cb25f0534eff68852'
         '687586a108b597a2a6b73070c1d37e51'
         '3dd50347d8856160a9cbd7f80383a1f8'
         '148b285bccee9d21bb96db807363b962'
         'edea272dff4698470877c016d818918d'
         '394e7bb35b7f1eaacf0a6e233c6fee86'
         'ade63655d7b17140b00edfaff1e25a12')

prepare() {
  cd SDL-$pkgver
  patch -Np1 -i ../sdl-1.2.14-fix-mouse-clicking.patch
  patch -Np1 -i ../sdl-1.2.14-disable-mmx.patch
  patch -Np1 -i ../fix_joystick_misc_axes.diff
  patch -Np1 -i ../libsdl-1.2.15-resizing.patch
  patch -Np0 -i ../sdl_x11sym.patch
  patch -Np1 -i ../X11_KeyToUnicode.patch
  patch -Np1 -i ../1sdl_changeres.diff
  patch -Np1 -i ../1xrand.diff
}

build() {
  cd SDL-$pkgver
  ./configure --prefix=/usr --disable-nasm --enable-alsa \
              --with-x --disable-rpath --disable-static
  make
}

package() {
  cd SDL-$pkgver
  make DESTDIR="$pkgdir" install
}
