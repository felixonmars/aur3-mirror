# Maintainer : ziggi <xziggix@gmail.com>
pkgname='curseofwar'
pkgver=1.2.0
pkgrel=1
pkgdesc='A fast-paced RTS/Action game with ncurses interface'
arch=('i686' 'x86_64')
url='https://github.com/a-nikolaev/curseofwar/wiki'
license=('GPL')
depends=('ncurses')
provides=('curseofwar')
conflicts=('curseofwar')
makedepends=('gcc')
source=("https://github.com/a-nikolaev/curseofwar/archive/v$pkgver.tar.gz")
md5sums=('361f364342af357ed78ae4eabe465da8')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make DESTDIR="$pkgdir/" install
}
