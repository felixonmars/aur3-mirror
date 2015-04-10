#Contributor: twa022 <twa022 at gmail dot com>

pkgname="zeitgeist-datasources-bzr"
pkgdesc="Zeitgeist data sources (bzr version)"
pkgver=181
pkgrel=1
arch=('i686' 'x86_64')
url="https://launchpad.net/zeitgeist-datasources"
license=('GPL3')
provides=(zeitgeist-datasources{,-bzr}=$pkgver)
depends=('libzeitgeist' 'python')
makedepends=('bzr')
source=('bzr+lp:zeitgeist-datasources'
        'vim74.patch')
sha512sums=('SKIP'
            'b8a783b2f4b05cdae61ef463a1ad9e56a6c687495eb47bd9fb546e92f632d4f9a0c35be1f4d234f7eac74d6755890df7a16d6c8d79fa261759d3686d16084d03')

pkgver() {
  cd zeitgeist-datasources
  bzr revno
}

prepare() {
# apply patches
  patch -p1 -d "$srcdir/zeitgeist-datasources" < "$startdir/vim74.patch"
}

build() {
  cd "$srcdir/zeitgeist-datasources"

  #
  # BUILD
  #
  msg "Starting make..."

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/zeitgeist-datasources"

  make DESTDIR="$pkgdir/" install
}
