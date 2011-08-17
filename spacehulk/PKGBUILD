#Maintainer: HalJ <bill.rich@gmail.com>
pkgname=spacehulk
pkgver=1.5
pkgrel=beta1
pkgdesc="Qspacehulk."
url="http://r.vinot.free.fr/spacehulk/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('qt3')
makedepends=()
conflicts=()
replaces=()
backup=()
#install='foo.install'
source=("http://r.vinot.free.fr/spacehulk/spacehulk-${pkgver}-${pkgrel}.tar.gz")
md5sums=('43eb76b5a2b59e8af2205bff145cbfb2')
     
build() {
  tar xvzf ${pkgname}-${pkgver}-${pkgrel}.tar.gz
  cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"
  source /etc/profile.d/qt3.sh
  ./configure
  sed -i '1i #include <stdlib.h>' src/rand.h
  make
}
     
package() {
  cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
     
