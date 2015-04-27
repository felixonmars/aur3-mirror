
pkgname=kodi-addon-pvr-mythtv-devel
_gitname=pvr.mythtv
pkgver=20150306.aa7df76
_gitver=aa7df76ecb308368e71a9e719053a3b63b5b8221
pkgrel=1
pkgdesc='MythTV client addon for Kodi'
arch=('i686' 'x86_64')
url="https://github.com/kodi-pvr/$_gitname"
license=('GPL')
makedepends=('cmake' 'kodi-platform-devel')
depends=('kodi-devel' 'mythtv')
source=("https://github.com/kodi-pvr/$_gitname/archive/$_gitver.tar.gz")
md5sums=('SKIP')

_prefix='/usr'

prepare() {
  msg "Starting make..."
  cd "$srcdir/$_gitname-$_gitver"
}

build() {
  cd "$srcdir/$_gitname-$_gitver"
  mkdir -p build && pushd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=$_prefix \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
  popd
}

package() {
  cd "$srcdir/$_gitname-$_gitver/build"
  make DESTDIR="$pkgdir" install
}
