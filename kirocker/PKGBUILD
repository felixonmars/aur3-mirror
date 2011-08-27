# Contributor: Christian Estrella Rdz <warc3r@gmail.com>

pkgname=kirocker
pkgver=4.0Beta3
pkgrel=1
pkgdesc="Kicker applet that displays what you're listening to (with album cover and optionally in full-screen mode) and lets you control Amarok."
url="http://www.kde-apps.org/content/show.php?content=52869"
license=('GPL')
depends=('kdebase')
arch=('i686')
conflicts=('kirocker')
replaces=('kirocker')
source=("http://slaout.linux62.org/kirocker/$pkgname-$pkgver.tar.gz")
md5sums=('566287843dd4d9f0282ce727b1ef4ec9')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/opt/kde
	make || return 1
	make DESTDIR=$startdir/pkg install
}
