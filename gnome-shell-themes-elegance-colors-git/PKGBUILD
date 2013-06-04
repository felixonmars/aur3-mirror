# Maintainer: Rasmus Schults <rasmusx@gmail.com>
pkgname=gnome-shell-themes-elegance-colors-git
pkgver=20130605
pkgrel=1
pkgdesc="A chameleon theme for Gnome Shell which can change colors according to the current GTK theme, current wallpaper (uses imagemagick to get color) or a user defined color."
arch=('i686' 'x86_64')
url="https://github.com/satya164/elegance-colors"
license=('GPLv3')
depends=('gtk3' 'gnome-shell>=3.6' 'glib2' 'imagemagick')
makedepends=('vala')
conflicts=('gnome-shell-themes-elegance-colors')
source=($pkgname-$pkgver::'git://github.com/satya164/elegance-colors.git')
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
