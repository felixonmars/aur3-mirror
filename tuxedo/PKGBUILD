# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=tuxedo
pkgver=0.1.1
pkgrel=2
pkgdesc="A simple and intuitive todo list."
arch=('i686' 'x86_64')
url="http://code.google.com/p/tuxedo"
license=('GPL')
depends=('python' 'pygtk' 'sqlite3')
source=(http://tuxedo.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=(c55fc0c0205297bd69fa58706a2b88ef)

build() {
	cd $startdir/src/$pkgname-$pkgver
	mkdir -p $pkgdir/usr/share/applications
	sed 's|/usr/|../../pkg/usr/|' -i install
	./install
}
