# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=cynthiune
_pkgname=Cynthiune
pkgver=1.0.0
pkgrel=1
pkgdesc="Versatile music player for GNUstep"
arch=('i686' 'x86_64')
url="http://gap.nongnu.org/cynthiune/index.html"
license=('GPL')
depends=('gnustep-base' 'gnustep-gui' 'libmad' 'libid3tag' 'libmodplug' 'taglib')
makedepends=('gcc-objc' 'gendesk')
source=(http://savannah.nongnu.org/download/gap/$_pkgname-$pkgver.tar.gz)
md5sums=('def432ba1667d822587466305be629fe')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	gendesk -n -f --pkgname=$_pkgname --pkgdesc="A free and romantic music player" --categories="AudioVideo;Audio;Player"
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	. /usr/share/GNUstep/Makefiles/GNUstep.sh
	make disable-windowsmedia=yes disable-musepack=yes disable-esound=yes disable-arts=yes
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make disable-windowsmedia=yes disable-musepack=yes disable-esound=yes disable-arts=yes DESTDIR="$pkgdir" install
	install -Dm644 Images/$_pkgname.xpm "$pkgdir/usr/share/pixmaps/$_pkgname.xpm"
	install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
