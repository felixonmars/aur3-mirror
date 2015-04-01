# Maintainer: Felix Wolff <felix.stefan.wolff+aur - at - gmail.com>
pkgname=ozon-gtk-theme-git
pkgver=0.1
pkgrel=2
pkgdesc="Official GTK theme for OZON OS"
arch=('any')
url="https://github.com/ozonos/ozon-gtk-theme"
license=('GPL')
makedepends=('ruby' 'ruby-sass')
source=('git+https://github.com/ozonos/ozon-gtk-theme')
md5sums=('SKIP')

build() {
	cd "$srcdir/ozon-gtk-theme"
	make
}

package() {
	cd "$srcdir/ozon-gtk-theme"
	make DESTDIR="$pkgdir/" install
}
