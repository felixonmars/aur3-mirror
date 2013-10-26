# Maintainer [-git]: John Schoenick <john@pointysoftware.net>
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: buddabrod <buddabrod@gmail.com>
# Contributor: Tavian Barnes <tavianator@gmail.com>

pkgname=xf86-video-nouveau-git
_basename=xf86-video-nouveau
pkgver=1.0.9.3.g0364232
pkgrel=1
pkgdesc="nvidia opensource X driver"
arch=(i686 x86_64)
url="http://nouveau.freedesktop.org/"
license=('GPL')
depends=('libdrm-git' 'libgl' 'udev' 'nouveau-dri')
makedepends=('xorg-server-devel' 'resourceproto' 'scrnsaverproto')
options=('!libtool')
conflicts=('xf86-video-nouveau')
provides=('xf86-video-nouveau')
install="$_basename.install"
source=('git://anongit.freedesktop.org/git/nouveau/xf86-video-nouveau')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_basename"
  local ver="$(git describe --always)"
  ver="${ver#${_basename}-}"
  echo "${ver//-/.}"
}

build() {
  cd "$srcdir/$_basename"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_basename"
  make DESTDIR="$pkgdir" install
}
