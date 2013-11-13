# Maintainer: Kyle <kyle@gmx.ca>
pkgname=java-atk-wrapper
pkgver=0.30.4
pkgrel=2
pkgdesc="ATK wrapper for screen reader access to Java Swing applications"
arch=(i686 x86_64)
url="https://git.gnome.org/browse/java-atk-wrapper/"
license=('LGPL')
groups=()
depends=(java-runtime atk xorg-xprop)
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/0.30/$pkgname-$pkgver.tar.bz2)
md5sums=('45b7aafdc4b9fd1c3dd0a39485df5dfa')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
