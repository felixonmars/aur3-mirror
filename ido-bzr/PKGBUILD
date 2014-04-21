# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Michal Gawronski <dinth1906@gmail.com>

pkgname=ido-bzr
_bzrname=ido
pkgver=182
pkgrel=3
pkgdesc="Widgets and other objects used for indicators. (Ayatana Project)"
arch=('i686' 'x86_64')
url="https://launchpad.net/ido"
license=('GPL')
depends=('gtk3-ubuntu' 'glib2')
makedepends=('bzr' 'gnome-common' 'gobject-introspection' 'gtk-doc' 'vala' 'xorg-util-macros')
provides=('ido')
conflicts=('ido')
source=("$_bzrname::bzr+http://bazaar.launchpad.net/~indicator-applet-developers/$_bzrname/trunk.14.04/")
md5sums=('SKIP')

pkgver() {
  cd $_bzrname
  bzr revno
}

build() {
  cd "$srcdir"/$_bzrname

  export CFLAGS="${CFLAGS} -Wno-error"
  autoreconf -vfi
  ./configure --prefix=/usr --disable-static --disable-introspection
  make
}

package() {
  cd "$srcdir"/$_bzrname

  make DESTDIR="$pkgdir" install
}
