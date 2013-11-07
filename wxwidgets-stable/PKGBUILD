# Maintainer: Victor Queiroz <victorqueiroz@outlook.com.br>
pkgname=wxwidgets-stable
pkgver=2.8.12
pkgrel=1
pkgdesc="wxWidgets is a C++ library that lets developers create applications for Windows, OS X, Linux and UNIX."
arch=('x86_64' 'i686')
url="http://www.wxwidgets.org/downloads/"
license=('LGPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(ftp://ftp.wxwidgets.org/pub/$pkgver/wxWidgets-$pkgver.tar.gz)
noextract=()
md5sums=('2fa39da14bc06ea86fe902579fedc5b1')

build() {
  cd "$srcdir/wxWidgets-$pkgver"

  ./configure
  make
}

package() {
  cd "$srcdir/wxWidgets-$pkgver"

  make DESTDIR="$pkgdir/" install
}
