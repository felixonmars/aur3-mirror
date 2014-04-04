# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=unity-lens-applications-bzr
pkgver=375 
pkgrel=5
_bzrname=unity-lens-applications
pkgdesc="Exposes your applications with their usage statistics and status to Unity"
arch=('i686' 'x86_64')
url="https://launchpad.net/unity-lens-applications"
license=('GPL')
depends=('libzeitgeist' 'libunity' 'gnome-menus' 'xapian-core' 'dconf' 'libcolumbus' 'libgee06')
makedepends=('vala' 'intltool' 'bzr')
conflicts=('unity-lens-applications')
provides=('unity-lens-applications')
install=$pkgname.install
source=("$_bzrname::bzr+http://bazaar.launchpad.net/~unity-team/$_bzrname/trunk/"
        '10-no-db51.patch')
md5sums=('SKIP'
         'a1291d658a3571e25b22a775563ad89c')

pkgver() {
  cd "$srcdir"/$_bzrname
  bzr revno
}

perpare() {
  cd "$srcdir"/$_bzrname
  patch -p1 -i "${srcdir}/10-no-db51.patch"
}

build() {
  cd "$srcdir"/$_bzrname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$_bzrname \
              --disable-static --disable-schemas-compile
  make
}

package() {
  cd "$srcdir"/$_bzrname
  make DESTDIR=$pkgdir/ install
}
