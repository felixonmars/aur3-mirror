# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=homerun
pkgver=1.2.0
pkgrel=4
epoch=
pkgdesc="Menu clean for KDE"
arch=('i686' 'x86_64')
url="http://blogs.kde.org/2014/01/29/homerun-120"
license=('GPL')
groups=()
depends=('kdebase-plasma' 'kdebase-workspace')
makedepends=('cmake' 'automoc4')
checkdepends=()
optdepends=()
provides=('homerunviewer')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://download.kde.org/stable/homerun/src/homerun-1.2.0.tar.xz")
noextract=()
md5sums=('c2b2b9114c0db15357fa97f766208ad4')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	if [ ! -d build ];
	then
		mkdir "build"
	else
		/bin/rm -rf build
		mkdir "build"
	fi
}

build() {
	cd "$srcdir/$pkgname-$pkgver/build"
	cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
