# Maintainer: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=gvidm
pkgver=0.8
pkgrel=2
pkgdesc="GTK app to quickly and easily change video resolutions in X"
arch=('i686' 'x86_64')
depends=('gtk2' 'libxxf86vm')
source=(http://users.dakotacom.net/~donut/programs/gvidm/$pkgname-$pkgver.tar.gz)
url="http://users.dakotacom.net/~donut/programs/gvidm.html"
license=('GPL')
md5sums=('fa9bbf18561c7830e0f9b2d3995e3720')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=${pkgdir}/usr install
}
