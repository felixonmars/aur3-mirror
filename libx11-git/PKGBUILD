# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libx11-git
_pkgname=libx11
_gitname=libX11
pkgver=1.5.99.901.1.gf49bb2d
pkgrel=1
pkgdesc="X11 client-side library (git version)"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org"
depends=('libxcb-git' 'xproto-git' 'kbproto-git')
makedepends=('xorg-util-macros' 'xextproto' 'xtrans' 'inputproto')
provides=("$_pkgname=$pkgver")
conflicts=('libx11')
options=('!libtool')
license=('custom')
source=('git://anongit.freedesktop.org/git/xorg/lib/libX11')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's/libX11-//; s/-/./g'
}

build() {
  cd $_gitname
  ./autogen.sh --prefix=/usr --disable-static --disable-xf86bigfont
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install

  install -d -m755 "$pkgdir/usr/share/licenses/$_pkgname"
  install -m644 COPYING "$pkgdir/usr/share/licenses/$_pkgname"
}
