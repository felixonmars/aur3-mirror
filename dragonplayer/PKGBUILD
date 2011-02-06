# Maintainer: Robert Mills <alysaundre a-t googlemail d-o-t com>
pkgname=dragonplayer
arch=(i686 x86_64)
pkgver=2.0.1
pkgrel=1
pkgdesc="Dragon Player is a simple video player for KDE 4 developed by Ian Monroe, based on Codeine by Max Howell."
url="http://www.dragonplayer.org"
license=('GPL')
depends=('kdelibs' 'kdebase' 'xine-lib')
makedepends=('cmake' 'automoc4')
provides=()
groups=()
source=("http://www.dragonplayer.net/dragonplayer-$pkgver.tar.bz2")
md5sums=('cc8218979bc91a87c409bb8dc21b3986')

build() {
cd $startdir/src/$pkgname-$pkgver
cmake -DCMAKE_INSTALL_PREFIX=/usr .
make || return 1
make DESTDIR=$startdir/pkg install
}
