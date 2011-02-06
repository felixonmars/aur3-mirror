# Contributor: Marcel Wysocki <maci at satgnu dot net>
# Maintainer: Marcel Wysocki <maci at satgnu dot net>

pkgname=zinnia-tomoe
pkgver=0.6.0
pkgrel=1
pkgdesc="Zinnia Model files trained with Tomoe data"
arch=('i686' 'x86_64')
url="hhttp://zinnia.sourceforge.net/"
license=('GPL2')
depends=('zinnia')
install=zinnia-tomoe.install
source=(http://downloads.sourceforge.net/project/zinnia/$pkgname/$pkgver-20080911/$pkgname-$pkgver-20080911.tar.bz2)
noextract=()
md5sums=('3d2e2ff6b83e142240c79118b43e682b')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}-20080911
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=${pkgdir} install
}
