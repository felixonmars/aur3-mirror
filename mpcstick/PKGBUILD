#$Id: $
#Maintainer: 
#Comments:
pkgname=mpcstick 
pkgver=0.10.2
arch=('i686')
pkgrel=1
pkgdesc="a joystick music player client for mpd"
url="http://www.musicpd.org/mpcstick.shtml?page=files#mpcstick"
license="GPL"
depends=()
source=(http://mercury.chem.pitt.edu/~shank/mpcstick-$pkgver.tar.gz \
	mpcstick-0.10.2-kru.patch)

md5sums=('8eb53ae02ad20cff5a14f442869ae041'
         '4963598173cf16be3800045bfe237bd9')

build() {

	cd $startdir/src/$pkgname-$pkgver
	patch -p0 -i ../mpcstick-0.10.2-kru.patch
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install
	mkdir -p $startdir/pkg/etc/
	cp mpcstick.conf $startdir/pkg/etc/mpcstick.conf.example
}
