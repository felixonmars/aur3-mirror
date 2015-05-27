# Maintainer:  Cecco4<gattifrancesco@hotmail.it>
pkgname='cetris'
pkgver=0.1
pkgrel=1
pkgdesc="$pkgname: A cool looking Tetris game"
arch=('any')
url=('https://github.com/cecco4/cetris')
license=('GPL')
source=('git+https://github.com/cecco4/cetris' $pkgname.desktop $pkgname.png)
depends=("sdl" "sdl_ttf" "sdl_mixer" "glu")
makedepends=('git' 'cmake')
md5sums=('SKIP' 'SKIP' 'SKIP')

build() {
	cd ${srcdir}/$pkgname

	cmake -DCMAKE_INSTALL_PREFIX=/usr . 
	make
}

package() {
	cd ${srcdir}/$pkgname

	make DESTDIR="${pkgdir}/" install;

	install -Dm644 ${srcdir}/$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
	install -Dm644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

}
