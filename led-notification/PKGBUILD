# Contributor: Mattheus Happe <mhappe@gmail.com>
pkgname=led-notification
pkgver=0.1
pkgrel=2
pkgdesc="If you have a led or anything else on your computer that is controlled by writing '1' or '0' into a file, then you can use it for Pidgin notifications with this plugin."
arch=(i686 x86_64)
url="http://simo.h.mattila.googlepages.com/led-notification"
license=('GPL')
depends=('pidgin')
source=(http://simo.h.mattila.googlepages.com/${pkgname}-${pkgver}.tar.bz2)
md5sums=('12aa9ffcd8fd7392126999d08b092150')

build() {
     cd $startdir/src/$pkgname-$pkgver
     make || return 1
     mkdir -p $startdir/pkg/usr/lib/pidgin
     install -m 755 -D led-notification.so $startdir/pkg/usr/lib/pidgin
}

