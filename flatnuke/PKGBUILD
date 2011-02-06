# Contributor: Simone Vellei <vellei@libero.it>
pkgname=flatnuke
pkgver=2.6
pkgrel=1
pkgdesc="Content Management System without database"
url="http://www.flatnuke.org"
depends=('apache' 'php')
makedepends=()
conflicts=()
replaces=()
backup=()
arch=('i686' 'x86_64')
license="GPL"
install=
source=(http://dl.sourceforge.net/sourceforge/flatnuke/$pkgname-$pkgver.tar.gz)
md5sums=('9e19c9ad7db63a1ddaa2d89b320375a0')

build() {
  cd $startdir/src/$pkgname-$pkgver
  mkdir -p $startdir/pkg/home/httpd/html/flatnuke || return 1
  cp -r * $startdir/pkg/home/httpd/html/flatnuke || return 1
  chown -R nobody:nobody $startdir/pkg/home/httpd/html/flatnuke || return 1
}
