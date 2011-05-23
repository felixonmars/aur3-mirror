
# Maintainer: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=c501checkers
pkgver=1.1.1
pkgrel=1
pkgdesc="Checkers game."
arch=('i686' 'x86_64')
url="http://en.congelli.eu/prog_info_c501checkers.html"
license=('GPL')
depends=('wxgtk' 'sfml')
madepends=('make' )
source=(http://congelli.kelio.org/download/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('ecf57105c5516238f44bcb2203269595')

build() {
cd ${srcdir}/$pkgname-$pkgver
./configure --prefix=/usr
make
}

package() {
cd ${srcdir}/$pkgname-$pkgver
make DESTDIR=${pkgdir} install
}
