# PKGBUILD written by 3ED

pkgname=kickerpager
pkgver=0.3.1
pkgrel=1
pkgdesc="Kicker Pager provides a desktop overview of your KDE virtual desktops. It aims to provide a more fully featured pager for the default Kicker panel."
depends=('kdebase')
url="http://www.nemohackers.org/kickerpager.php"
source=(http://199.231.140.154/software/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('31cf641db8343f9c0f5d6d0aa59f3726')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure 
	make || return 1
	make DESTDIR=$startdir/pkg install
}

					  
