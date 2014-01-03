# Maintainer: Andrew Gallant <aur@burntsushi.net>
pkgname=xorg-xpyb-git
_gitname=xpyb
pkgver=r93.ed0147e
pkgrel=1
pkgdesc="XCB-based Python bindings for the X Window System"
url="http://xcb.freedesktop.org"
license=('X11')
arch=(i686 x86_64)
depends=(python2 xcb-proto "libxcb>=1.7")
makedepends=(gcc git python2)
conflicts=(xpyb xpyb-git)
provides=(xpyb xpyb-git)
source=('git://anongit.freedesktop.org/xcb/xpyb')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  PYTHON=python2 ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}

