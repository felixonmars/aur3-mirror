# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=ncursesoflife
pkgver=1.2
pkgrel=4
epoch=
pkgdesc="Conway's Game of Life in Ncurses"
arch=('i386' 'x86_64')
url="https://github.com/AftExploision/NcursesOfLife"
license=('GPL')
groups=()
depends=("ncurses>=5.9")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=NcursesOfLife.install
changelog=
source=(source.tar.gz)
noextract=()
md5sums=('f5cbf97507705f497887c98f758f1007') #generate with 'makepkg -g'

prepare() {
	mkdir "$srcdir/$pkgname-$pkgver" -p
	#patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir "NcursesOfLife"
	tar -xf "$startdir/source.tar.gz" -C "$srcdir/$pkgname-$pkgver/NcursesOfLife"	
	cd "$srcdir/$pkgname-$pkgver/NcursesOfLife"
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	#make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver/NcursesOfLife"
	make DESTDIR="$pkgdir/" install
}
