# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: ilikenwf/ Matt Parnell <parwok@gmail.com>

pkgname=libxext-git
_gitname=libXext
pkgver=1.3.1.7.g8eee123
pkgrel=1
pkgdesc="X11 miscellaneous extensions library (git version)"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
depends=('libx11-git' 'xextproto-git')
makedepends=('pkgconfig')
provides=('libxext')
conflicts=('libxext')
options=('!libtool')
license=('custom')
source=('git://git.freedesktop.org/git/xorg/lib/libXext')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's/libXext-//; s/-/./g'
}

build() {
  cd $_gitname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
}
