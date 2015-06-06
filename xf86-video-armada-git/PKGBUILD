# Maintained [-git]: Brandon Edens <brandonedens@gmail.com>

pkgname=xf86-video-armada-git
_gitname=xserver-xorg-video-armada
_basename=xf86-video-armada
pkgver=8a461a2
pkgrel=1
pkgdesc="armada opensource X driver"
arch=(armv7h)
url="https://github.com/xobx/xserver-xorg-video-armada"
license=('GPL2')
depends=('libdrm' 'libgl' 'udev')
makedepends=('xorg-server-devel' 'resourceproto' 'scrnsaverproto')
conflicts=('xf86-video-armada')
provides=('xf86-video-armada')
install="$_basename.install"
source=("git+https://github.com/xobs/xserver-xorg-video-armada.git#tag=v0.0.1-r11")
sha1sums=("SKIP")

pkgver() {
  cd "$srcdir/$_gitname"
  local ver="$(git describe --always)"
  ver="${ver#${_basename}-}"
  echo "${ver//-/.}"
}

build() {
  cd "$srcdir/$_gitname"

  ./autogen.sh --prefix=/usr --disable-vivante
  make CFLAGS=-DHAVE_STRNDUP
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}

