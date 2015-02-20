# Maintainer: Neal Buchanan <neal.buchanan@gmx.com>
pkgname=ldmtool
pkgver=0.2.3
pkgrel=1
epoch=
pkgdesc="tool for managing Microsoft Windows dynamic disks"
arch=('any')
url="https://github.com/mdbooth/libldm"
license=('GPL')
groups=()
depends=(gtk-doc json-glib)
makedepends=()
checkdepends=()
optdepends=()
provides=('ldmtool', 'libldm')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname-$pkgver.tar.gz
        $pkgname-$pkgver.patch)
noextract=()
md5sums=('0586e22bc6bef09d4ff35529ff25dcf6'
         '044023305cae7025110b2a8afb70b475')
prepare() {
	patch -p0 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	./autogen.sh
	./configure
	make
}

package() {
	make DESTDIR="$pkgdir/" install
	mv $pkgdir/usr/local/share/man $pkgdir/usr/local/man
}
