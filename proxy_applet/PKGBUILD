# Maintainer : Neimad <damien.gy@gmail.com>
pkgname=proxy_applet
pkgver=0.2
pkgrel=1
pkgdesc="GNOME applet to change network proxy configuration with a single click from the gnome panel"
arch=(i686 x86_64)
url="http://www.andreafabrizi.it/?proxyapplet"
license=('GPL')
groups=
provides=
depends=()
makedepends=
conflicts=
replaces=
backup=
install=
source=(http://www.andreafabrizi.it/download.php?file=proxy_applet-$pkgver.tar.gz)
md5sums=('16857ba083bf1998317430ec43d13598')

build() {
#	cd $startdir/src/$pkgname-$pkgver
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr/ --libexecdir=/usr/lib/gnome-applets
	make || return 1
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
