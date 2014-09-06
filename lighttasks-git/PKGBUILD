# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Shafqat Bhuiyan <priomsrb at gmail dot com>

_pkgname=lighttasks
pkgname=lighttasks-git
pkgver=0.1.r35.g475d232
pkgrel=1
pkgdesc="simple and lightweight task timer."
arch=('i686' 'x86_64')
url="https://github.com/priomsrb/lighttasks"
license=('GPL2')
depends=('qt4')
makedepends=('git')
provides=('lighttasks')
conflicts=('lighttasks')
source=("git://github.com/priomsrb/lighttasks.git")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
}

build() {
  cd "$srcdir/$_pkgname"

  qmake-qt4 PREFIX="/usr/"
  make
}


package() {
  cd "$srcdir/$_pkgname"

  make INSTALL_ROOT="$pkgdir" install
}
