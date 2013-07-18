# Maintainer: Georgios Tsalikis <anaphaxeton somewhere near tsalikis and a net>

pkgname=flux
pkgver=1.4.4
pkgrel=1
pkgdesc="flux is an interface description language used by DirectFB"
arch=('i686' 'x86_64')
url=("http://www.directfb.org")
license=('MIT')
depends=()
source=("http://www.directfb.org/downloads/Core/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('13e88fd3cec555bc533292e223579fe1cda7786c76f9413ea75bc24fbcedfea7')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"

  make -j1 DESTDIR="$pkgdir" install
}
