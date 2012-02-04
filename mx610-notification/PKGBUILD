# Contributor: Mattheus Happe <mhappe@gmail.com>
pkgname=mx610-notification
pkgver=0.5
pkgrel=2
pkgdesc="Informs for new unread messages with your mouse's IM-led and raises the conversation window with a press of the IM-button. "
arch=(i686 x86_64)
url="http://simo.h.mattila.googlepages.com/mx610-notification"
license=('GPL')
depends=('pidgin')
source=(http://simo.h.mattila.googlepages.com/${pkgname}-${pkgver}.tar.bz2)
md5sums=('2d311b1278e3efb1e7a617cbffc34dc1')

build() {
     cd $startdir/src/$pkgname-$pkgver
     make || return 1
     mkdir -p $startdir/pkg/usr/lib/pidgin
     install -m 755 -D mx610-notification.so $startdir/pkg/usr/lib/pidgin
}

