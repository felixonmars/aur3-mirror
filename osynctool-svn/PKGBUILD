# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Samuele Disegna <smldis@gmail.com>

pkgname=osynctool-svn
_pkgname=${pkgname%-*}
pkgver=0.40.r6052
pkgrel=1
pkgdesc="Development version of the CLI interface to the opensync synchronization framework"
url="http://www.opensync.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libopensync-svn')
makedepends=('subversion' 'cmake')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::svn+http://svn.opensync.org/osynctool/trunk")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  local version=$(grep -m1 OSYNCTOOL_VERSION CMakeLists.txt | cut -d '"' -f2)

  printf "$version.r$(svn info | awk '/Last Changed Rev/ {print $4}')"
}

build() {
  cd "$srcdir/$_pkgname"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

  mv "$pkgdir/usr/etc" "$pkgdir/etc"
}
