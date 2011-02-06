# Contributor: Krzemin <pkrzemin@o2.pl>

pkgname=compal-laptop-control
pkgver=0.3.4
pkgrel=1
pkgdesc="GUI toolkit for Compal FL90/IFL90 and similar laptops"
arch=('i686' 'x86_64')
url="http://krzemin.iglu.cz/compal-laptop-control"
license=('GPL')
depends=('qt>=4.3.0')
source=("http://krzemin.iglu.cz/compal-laptop-control/compal-laptop-control-${pkgver}.tar.gz")
md5sums=('a45b777a42de3db42230c81e68a9a3a9')
options=('docs')

build() {
  unset QTDIR
  cd $startdir/src/$pkgname-$pkgver
  qmake || return 1
  make || return 1
  make INSTALL_ROOT=$startdir/pkg install
}
