# Maintainer: Chih-Mao Chen <pkmx.tw@gmail.com>

pkgname=eureka-editor
_pkgname=eureka
pkgver=1.07
pkgrel=1
epoch=
pkgdesc="A map editor for classic Doom"
arch=('i686' 'x86_64')
url='http://eureka-editor.sourceforge.net/'
license=('GPL')
groups=()
depends=('fltk' 'libgl') # 'zlib' is required, but already a dependency of fltk.
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://downloads.sourceforge.net/project/${pkgname}/Eureka/${pkgver}/eureka-${pkgver}-source.tar.gz")
noextract=()
md5sums=('b9f3048ee56e4e7dcaa8c2e1c5bc7076')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver-source"
        sed -i -e '/xdg-desktop-menu/d' -e '/xdg-icon-resource/d' Makefile
}

build() {
	cd "$srcdir/$_pkgname-$pkgver-source"
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver-source"
        mkdir -p "$pkgdir/usr/bin"
	make PREFIX="$pkgdir/usr" install
}
