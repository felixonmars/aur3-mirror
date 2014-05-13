# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Michal Gawronski <dinth1906@gmail.com>

pkgname=libunity-misc-bzr
pkgver=40
pkgrel=7
_bzrname=libunity-misc
pkgdesc="Misc. differently licensed stuff for Unity (Canonical Ayatana Project)"
arch=('i686' 'x86_64')
url="https://launchpad.net/unity"
license=('GPL')
depends=('gtk3')
makedepends=('bzr' 'gtk-doc')
provides=('libunity-misc')
conflicts=('libunity-misc')
source=("$_bzrname::bzr+http://bazaar.launchpad.net/~unity-team/$_bzrname/trunk/"
        '0001_autotools.patch')
sha512sums=('SKIP'
            'f1f7059f9eb90836383a3742cb4ff701cf1187209a6e7afc23b5efe9a70f20084d4a4d8d499469de79ed0679ead1d9ff45c7b5fc8207a3ba30e624eeadd3be86')

pkgver() {
  cd "$srcdir"/$_bzrname
  bzr revno
}

prepare() {
  cd "$srcdir"/$_bzrname
  patch -p1 -i "${srcdir}/0001_autotools.patch"
}

build() {
  cd "$srcdir"/$_bzrname
 
  gtkdocize
  autoreconf -vfi
  ./configure --prefix=/usr --disable-static
  make
}
package() {
  cd "$srcdir"/$_bzrname
  make DESTDIR="$pkgdir" install
}
