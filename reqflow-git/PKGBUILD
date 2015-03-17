#Contributor: mathieu.clabaut <mathieu.clabaut@gmail.com>

pkgname=reqflow-git
pkgver=r137.b906290
pkgrel=1
pkgdesc="Requirement traceability tool"
arch=('i686' 'x86_64')
url="https://github.com/goeb/reqflow"
license=('GPL2')
provides=('reqflow')
conflicts=('reqflow')
makedepends=('gcc')
depends=()
optdeps=()
source=('reqflow::git://github.com/goeb/reqflow')
md5sums=('SKIP')


build() {
  cd $srcdir/reqflow
  ./configure --prefix=/usr
  make DESTDIR=$pkgdir
}

package() {
  cd $srcdir/reqflow
  make DESTDIR=$pkgdir install
}


pkgver() {
  cd "$srcdir/reqflow"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
