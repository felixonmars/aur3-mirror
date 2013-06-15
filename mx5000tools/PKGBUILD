# Maintainer: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
pkgname=mx5000tools
pkgver=0.1.2
pkgrel=3
pkgdesc="Control your Logitech MX 5000 keyboard"
arch=('i686' 'x86_64')
url="http://home.gna.org/mx5000tools"
license=('GPL')
depends=('netpbm' 'glib2')
options=('!libtool')
source=("http://download.gna.org/mx5000tools/mx5000tools-${pkgver}.tar.gz")
md5sums=('e8f3385dcb49a000975dbe62fe15cd45')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	CPPFLAGS="-I /usr/include/netpbm" ./configure --prefix=/usr
	make
}

check() {
        cd "$srcdir/$pkgname-$pkgver"
        make -k check
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
        make DESTDIR="$pkgdir/" install
}
