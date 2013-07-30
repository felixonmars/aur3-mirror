# Maintainer: Will Foran <willforan+arch@gmail.com>
pkgname=infomap
pkgver=0.11.5
pkgrel=1
epoch=
pkgdesc="algorithm for detecting communities in large networks"
arch=(x86_64 i686)
url="http://www.mapequation.org/code.html"
license=('AGLP')
groups=()
depends=()
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
source=( http://www.mapequation.org/downloads/Infomap-$pkgver.zip)
noextract=()
md5sums=('95fd7957343a6ef9a9b3065313a48c0c')

prepare() {
	cd "$srcdir/Infomap-$pkgver"
}

build() {
	cd "$srcdir/Infomap-$pkgver"
	make
}

package() {
	cd "$srcdir/Infomap-$pkgver"
   mkdir -p $pkgdir/usr/bin/
   install Infomap $_
}
