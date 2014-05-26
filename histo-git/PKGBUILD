# Maintainer: lucy <lucy@luz.lu>

pkgname=histo-git
_gitname='histo'
pkgver=0.38.0.0.2
pkgrel=2
pkgdesc='Beautiful charts in the terminal for static or streaming data'
url='https://github.com/visionmedia/histo'
license=('custom:MIT')
makedepends=('git')
arch=('i686' 'x86_64')
source=('git://github.com/visionmedia/histo.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
	cd "$srcdir/$_gitname"
	make
}

package() {
	cd "$srcdir/$_gitname"
	install -Dm755 -T histo "$pkgdir/usr/bin/histo"
	docs="$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 -T Readme.md "$docs/Readme.md"
	install -Dm755 -d "$docs/examples"
	install -Dm644 -t "$docs/examples" examples/* 
}
