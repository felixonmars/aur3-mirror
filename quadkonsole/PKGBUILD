# Contributor: Leigh <leighallison at earthlink.net>

pkgname=quadkonsole
pkgver=2.0.3
pkgrel=1
pkgdesc="Program which embeds 4 KDE Konsoles (kde3)"
license=('GPL')
depends=('kdelibs3')
arch=('i686' 'x86_64')
url="http://nomis80.org/"
source=(http://nomis80.org/quadkonsole/$pkgname-$pkgver.tar.bz2)
md5sums=('a16fe06221f2f1c4ff16e707d5741a4e')

build() {
	source /etc/profile.d/qt3.sh
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/opt/kde
	make || return 1
	make DESTDIR=$startdir/pkg install			
}

