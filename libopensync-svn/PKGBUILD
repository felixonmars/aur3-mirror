# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Samuele Disegna <smldis@gmail.com>

pkgname=libopensync-svn
_pkgname=${pkgname%-*}
pkgver=0.40.r6212
pkgrel=1
pkgdesc="Development version of the opensync synchronisation framework"
arch=('i686' 'x86_64')
url="http://www.opensync.org"
license=('LGPL')
depends=('sqlite' 'glib2' 'libxslt')
makedepends=('subversion' 'cmake')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::svn+http://svn.opensync.org/trunk")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  local version=$(grep -m1 OPENSYNC_VERSION_MAJOR CMakeLists.txt | grep -o "[[:digit:]]*").$(grep -m1 OPENSYNC_VERSION_MINOR CMakeLists.txt | grep -o "[[:digit:]]*")

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
}
