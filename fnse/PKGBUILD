# Contributor: ale_xiovk < a.dipaolosanti at gmail dot com >

pkgname=fnse
pkgver=1.2.1
pkgrel=1
pkgdesc="The FNS Setup program configures the computer to browse through sites with names FNS"
arch=('any')
url="http://www.freenamesystem.it/en/"
license=('GPL')
depends=('iptables')
source=("http://download.freenamesystem.eu/pub/FNSsetup/AUR/$pkgname-$pkgver.tar.gz")
md5sums=('2e43ffefacf53c4fd08b5f095aebe193')


build() {
	cd $srcdir/$pkgname-$pkgver
	./configure
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make install
}




