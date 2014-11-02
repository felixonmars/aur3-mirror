# Original maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Maintainer: Patrick Ulbrich <zulu99@gmx.net>

# SDL2 Archlinux package with OpenGL ES support for embedded devices like the Raspberry Pi.
# Based on the work of Fred Morcos <fred.morcos@gmail.com> for the Raspberry Pi.

pkgname=sdl2-opengles
pkgver=2.0.3
pkgrel=1
pkgdesc="SDL2 library with OpenGL ES support for embedded devices like the Raspberry Pi"
arch=('i686' 'x86_64' 'armv6h')
url="http://www.libsdl.org"
license=('MIT')
depends=('glibc' 'libgl')
makedepends=('alsa-lib' 'mesa' 'libxkbcommon' 'raspberrypi-firmware')
optdepends=('alsa-lib: ALSA audio driver')
conflicts=('sdl2')
provides=('sdl2')
replaces=('sdl2')
source=("http://www.libsdl.org/release/SDL2-${pkgver}.tar.gz")
md5sums=('fe6c61d2e9df9ef570e7e80c6e822537')

prepare() {
  mkdir build
}

build() {
  cd build
  ../SDL2-$pkgver/configure --prefix=/usr \
    --enable-sdl-dlopen \
    --disable-arts --disable-esd --disable-nas \
    --enable-alsa \
    --disable-pulseaudio \
    --disable-video-wayland \
    --without-x --disable-video-x11 --disable-x11-shared \
    --disable-video-x11-xcursor --disable-video-x11-xinerama \
    --disable-video-x11-xinput --disable-video-x11-xrandr \
    --disable-video-x11-scrnsaver --disable-video-x11-xshape \
    --disable-video-x11-vm --disable-video-opengl \
    --disable-video-directfb --enable-video-opengles \
    --disable-rpath
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../SDL2-$pkgver/COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
