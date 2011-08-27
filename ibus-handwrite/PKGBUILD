# Contributor: Marcel Wysocki <maci at satgnu dot net>
# Maintainer: Marcel Wysocki <maci at satgnu dot net>

pkgname=ibus-handwrite
pkgver=2.1.3
pkgrel=1
pkgdesc="Handwriting input engine for IBus"
arch=('i686' 'x86_64')
url="http://ibus.googlecode.com"
license=('GPL2')
depends=('ibus>=1.3.0' 'zinnia-tomoe' 'gtkglext')
install=ibus-handwrite.install
source=(http://ibus-handwrite.googlecode.com/files/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('887a6b44f01f3eaff45b0af1a996d4cc')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr --libexecdir=/usr/lib/ibus --enable-zinnia --with-zinnia-tomoe=/usr/lib/zinnia/model/tomoe/ 
	make || return 1
	make DESTDIR=${pkgdir} install
}
