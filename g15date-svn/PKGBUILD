#Maintainer: Dean Birch <dean.birch0@gmail.com>
pkgname=g15date-svn
pkgver=0.2
pkgrel=2
pkgdesc="Displays date and time (including an analogue clock) for the G15 keyboard LCD screen."
arch=('any')
url=('https://github.com/dean36963/g15date')
license=('Unknown')
depends=('g15daemon-svn' 'libg15render-svn' 'libg15-svn')
source=(https://github.com/downloads/dean36963/g15date/g15date-svn-0.2-2.tar.gz/$pkgname-$pkgver-$pkgrel.tar.gz)
md5sums=('659a076b383680f21e16147518a52d1b')

build() {
	cd "$srcdir"
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin/"
	cp "$srcdir/g15date" "$pkgdir/usr/bin/"
}

