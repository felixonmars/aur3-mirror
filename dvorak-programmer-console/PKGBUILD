# Maintainer: SREW <stephane.weiss@free.fr>
pkgname=dvorak-programmer-console
pkgver=0.1
pkgrel=1
pkgdesc="Dvorak programmer (DVP) layout for the console"
arch=(any)
url="http://stephane.weiss.free.fr/dvp"
license=('GPL')
groups=()
depends=(kbd)
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
source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('7a01cd8647b851b6a306d3ffe9f0bb77')
_keymapdir="usr/share/kbd/keymaps/i386/dvorak/"

package() {
	echo Copying dvorak-programmer.map.gz to /$_keymapdir
	mkdir -p "$pkgdir/$_keymapdir"
	cp $srcdir/$_keymapdir/dvorak-programmer.map.gz "$pkgdir/$_keymapdir"
}
