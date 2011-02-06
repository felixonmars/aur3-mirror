# Contributor: Jan Mette (funkyou) <jan.mette@berlin.de>

pkgname=karmack
arch=('i686' 'x86_64')
pkgver=0.2
pkgrel=2
pkgdesc="Karmack is a CPU load monitor for kicker which uses the the form of the classic Doom game's marine face."
url="http://www.kde-apps.org/content/show.php?content=10841"
license="GPL"
depends=('kdebase3')
source=("http://evilrobot.free.fr/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('6ef93bab5a98f93fc212e766746d775e')

build() {
	source /etc/profile.d/qt3.sh
	source /etc/profile.d/kde3.sh

	cd $srcdir/$pkgname-$pkgver/
	./configure --prefix=/opt/kde --without-arts
	make || return 1
	make DESTDIR=$pkgdir install
} 
