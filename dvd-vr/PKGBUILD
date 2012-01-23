# Contributor: Georgo10 <georgo10@gmail.com>
pkgname=dvd-vr
pkgver=0.9.7
pkgrel=1
pkgdesc="Utility to identify and optionally copy recordings from a DVD-VR format disc"
url="http://www.pixelbeat.org/programs/dvd-vr/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('glibc')

source=(http://www.pixelbeat.org/programs/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('cdc8fe3d5414452a67c3076598fc401c')

build() {
	cd $srcdir/$pkgname-$pkgver
	make || return 1
	make install PREFIX=/usr DESTDIR=$pkgdir || return 1
}
