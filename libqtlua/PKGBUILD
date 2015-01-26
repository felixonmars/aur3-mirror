# Maintainer: Alexandre Becoulet <alexandre.becoulet@free.fr>

pkgname=libqtlua
pkgver=2.0
pkgrel=4
pkgdesc="Make Qt applications scriptable using the Lua scripting language"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/libqtlua/"
license=('LGPL3')
depends=("qt5-base" "qt5-tools" "lua>=5.0.0")
options=(libtool)
source=(http://download.savannah.gnu.org/releases/libqtlua/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DLUA_LIBRARY=/usr/lib/liblua.so
  # ./configure --prefix=/usr --disable-examples --enable-qtrelease || return 1

  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

md5sums=('72f98539a11579013fe997d9cd9986f0')
