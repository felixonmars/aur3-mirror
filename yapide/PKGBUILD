# Contributor: Marcel Schneider <marcelATcoopmastersDOTde>
# Maintainer: Laszlo Papp <djszapi2 at gmail dot com>
pkgname=yapide
pkgver=0.1.1
pkgrel=5
pkgdesc="Fully featured Microchip PIC simulator for Linux"
url="http://www.mtoussaint.de/yapide.html"
license=('GPL')
depends=('qt3')
arch=('i686')
source=(http://www.mtoussaint.de/$pkgname-$pkgver.tgz
        gcc-4.3.1.patch)
md5sums=('d5eea72bb8d3ca2606b9ff6337a935c3'
         '54d92e5eed43c7764673603ceb5dc0ca')

build() {
  export PATH=/opt/qt/bin:$PATH #make sure to use qmake version qt3
  mv ${srcdir}/YaPIDE-$pkgver ${srcdir}/$pkgname-$pkgver
  cd ${srcdir}/$pkgname-$pkgver
  patch -Np1 -i ../../gcc-4.3.1.patch || return 1
  export KDEDIRS=${pkgdir}/usr:/opt/kde
  ./configure
  make || return 1
  install -Dm755 ${srcdir}/$pkgname-$pkgver/bin/$pkgname ${pkgdir}/usr/bin/${pkgname} || return 1
}
