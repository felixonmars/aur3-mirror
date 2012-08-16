pkgname=fbterm-ibus
pkgver=1.0.0
pkgrel=1
pkgdesc="IBus input method for fbterm"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fbterm-ibus"
license=('GPL3')
depends=('fbterm>=1.7' 'ibus>=1.4')
source=("http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
install=fbterm-ibus.install
md5sums=('885b70081081f4bc47dfff3679432854')

build() {
	cd ${srcdir}/${pkgname}-${pkgver%.?}
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
}
