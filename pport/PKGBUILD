
# Maintainer: schef

pkgname=pport
pkgver=0.6.9
pkgrel=1
pkgdesc="Is a simple yet handy automation program and its documented counterpart for interfacing a PC with external devices. With this bundle, one can control any household appliance or electronic device with minimal hassle and practically no changes."
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/pport/"
license=('GPL')
depends=('popt')
install=pport.install
source=(http://sourceforge.net/projects/pport/files/pport/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz/download)
md5sums=('97c0a384d918b8e26022025c3310391f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make install PREFIX=${pkgdir}/usr || return 1
}
