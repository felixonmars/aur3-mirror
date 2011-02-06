
# Maintainer: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=lettergames
pkgver=1.0.1
pkgrel=1
pkgdesc="Games with letter: The Longest Word and HangMan"
arch=('i686' 'x86_64')
url="http://fr.congelli.eu/prog_info_lettergames.html"
license=('GPL')
depends=('wxgtk' 'shared-mime-info')
madepends=('make' )
source=(http://fr.congelli.eu/download/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('880de6ffd30c53a108cf0b56e908b20d')

build() {
cd ${srcdir}/$pkgname-$pkgver
./configure --prefix=/usr
make || return 1
make DESTDIR=${pkgdir} install
}
