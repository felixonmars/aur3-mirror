# Maintainer: Jerome Leclanche <jerome.leclanche+arch@gmail.com>

_pkgname=samba-mounter
pkgname=$_pkgname-git
pkgver=60.b61258e
pkgrel=1
pkgdesc="User space mount tool for samba"
url="http://quickgit.kde.org/?p=scratch%2Fafiestas%2Fsamba-mounter.git"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdelibs' 'cifs-utils' 'smbclient')
makedepends=('cmake' 'git' 'automoc4')
provides=('samba-mounter')

source=("git://anongit.kde.org/scratch/afiestas/samba-mounter.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
	cd "$srcdir"
	mkdir -p build
	cd build

	cmake "../$_pkgname" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "$srcdir/build"

	make DESTDIR="$pkgdir" install
}
