# $Id: PKGBUILD 76261 2012-09-15 09:40:24Z heftig $
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_pkgbasename=sdl
pkgname=libx32-$_pkgbasename
pkgver=1.2.15
pkgrel=3.1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (x32 ABI)"
arch=('x86_64')
url="http://www.libsdl.org"
license=('LGPL')
depends=('libx32-libxext' 'libx32-libxrender' 'libx32-libx11' $_pkgbasename)
makedepends=('libx32-alsa-lib' 'libx32-mesa' 'libx32-libpulse' gcc-multilib-x32)
optdepends=('libx32-alsa-lib: ALSA audio driver'
            'libx32-libpulse: PulseAudio audio driver')
options=('!libtool')
source=(http://www.libsdl.org/release/SDL-${pkgver}.tar.gz
        sdl-1.2.14-fix-mouse-clicking.patch
        sdl-1.2.14-disable-mmx.patch
        fix_joystick_misc_axes.diff
        libsdl-1.2.15-resizing.patch)
md5sums=('9d96df8417572a2afb781a7c4c811a85'
         '04d8c179f125e04bcd4c9d60e013c2d7'
         'e5c16b7611f62c7cb25f0534eff68852'
         '687586a108b597a2a6b73070c1d37e51'
         '3dd50347d8856160a9cbd7f80383a1f8')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd SDL-$pkgver
  patch -Np1 -i ../sdl-1.2.14-fix-mouse-clicking.patch
  patch -Np1 -i ../sdl-1.2.14-disable-mmx.patch
  patch -Np1 -i ../fix_joystick_misc_axes.diff
  patch -Np1 -i ../libsdl-1.2.15-resizing.patch
  ./configure --prefix=/usr --disable-nasm --enable-alsa \
              --with-x --disable-rpath --disable-static --libdir=/usr/libx32
  make
}

package() {
  cd SDL-$pkgver
  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir"/usr/{include,share}

  cd "$pkgdir/usr/bin"
  mv sdl-config sdl-config-x32
}
