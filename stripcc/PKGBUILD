pkgname=stripcc
pkgver=0.2.0
pkgrel=1
pkgdesc="A little tool to remove unused code from C/C++ source files"
arch=("i686" "x86_64")
license=('GPL')
url="http://stripcc.sourceforge.net/"
depends=('glibc') 
makedepends=('gcc')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('689e33c7deea8d05b15ed103a34ac2bb')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make || return 1
  install -Dm755 stripcc ${pkgdir}/usr/bin/stripcc || return 1
}
