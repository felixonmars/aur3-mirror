
# Maintainer: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=resistancevalue
pkgver=1.0.1
pkgrel=1
pkgdesc="It gives value of a resistance, or the colors you have to choose."
arch=('i686' 'x86_64')
url="http://congelli.kelio.org/prog_info_resistancevalue.html"
license=('GPL')
depends=('wxgtk')
madepends=('make' )
source=(http://congelli.kelio.org/download/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('705849a254b648955c7bcade11df9224')

build() {
cd ${srcdir}/${pkgname}-${pkgver}
./configure --prefix=/usr
make || return 1
make DESTDIR=${pkgdir} install
}
