# Contributor: Max Howell <max.howell@methylblue.com>
pkgname=wocka
pkgver=0.5
pkgrel=1
pkgdesc="wocka will call make install, monitor the installation and create an entry in the pacman database, with the metadata automagically filled-in."
url="http://www.methylblue.com/wocka/"
depends=('installwatch')
makedepends=('dmd')
source=(http://www.methylblue.com/$pkgname/packages/$pkgname-$pkgver.tar.bz2)
md5sums=('1f547726cdc86ce92bc03c87dde5a660')
license="GPL"
arch=(i686)

build() {
  echo -e "\033[0;34m==>\033[0;0;1m Configure \033[0;0m"
  cd "$startdir/src/$pkgname-$pkgver"

  echo -e "\033[0;34m==>\033[0;0;1m Make \033[0;0m"
  make release || return 1

  echo -e "\033[0;34m==>\033[0;0;1m Install \033[0;0m"
  DESTDIR=$startdir/pkg make install
}
