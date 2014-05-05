# Maintainer: Ioan Moldovan <ioanm1999@outlook.com>
pkgname=snakegame
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A snake game with apples and bombs"
arch=('i686' 'x86_64')
url="http://ioanmoldovan.github.io"
license=('GPL')
groups=('games')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('bsd-games')
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/ioanmoldovan/snakegame/raw/master/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('123a1eee3f1d9fbeaa1fac024dc904c0') #generate with 'makepkg -g'

prepare() {
	cd "$srcdir"
	make clean
}

build() {
	cd "$srcdir"
	make
}

package() {
	cd "$srcdir"
	mkdir "$pkgdir/usr"
	make DESTDIR="$pkgdir/usr"  install
}
