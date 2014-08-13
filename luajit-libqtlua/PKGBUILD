# Maintainer: Lucas Hermann Negri <lucashnegri@gmail.com>

pkgname=luajit-libqtlua
pkgver=2.0
pkgrel=1
pkgdesc="Make Qt applications scriptable using the Lua scripting language"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/libqtlua"
license=('LGPL3')
makedepends=("cmake")
depends=("qt5-base" "qt5-tools" "luajit")
options=(libtool)
source=(http://download.savannah.gnu.org/releases/libqtlua/libqtlua-$pkgver.tar.gz luajit.patch)
md5sums=('72f98539a11579013fe997d9cd9986f0' '3e3b78773766f45e3d43fb05e9f969a9')

build() {
  cd "$srcdir/libqtlua-$pkgver"
  patch -p1 < "$srcdir/luajit.patch"
  mkdir bld
  cd bld
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DCMAKE_BUILD_TYPE=Release ..
  make -j
}

package() {
  cd "$srcdir/libqtlua-$pkgver/bld"
  make install
}
