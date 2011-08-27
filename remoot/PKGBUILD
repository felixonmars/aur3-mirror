pkgname=remoot
pkgver=0.9
pkgrel=1
pkgdesc="A remote control tool that supports many popular multimedia applications."
arch=('i686' 'x86_64')
url="http://remoot.sourceforge.net/"
license=('pal2.0')
depends=('tk')
source=(http://mesh.dl.sourceforge.net/sourceforge/remoot/$pkgname-$pkgver.tar.gz)
md5sums=('b94e5870308b366fafc9e9018edd6ac6')

build() {
	cd $startdir/src/$pkgname-$pkgver
	install -D -m755 daemoot $startdir/pkg/usr/bin/daemoot
	install -m755 remoot $startdir/pkg/usr/bin/remoot
	install -m755 remoot-remote $startdir/pkg/usr/bin/remoot-remote
}
