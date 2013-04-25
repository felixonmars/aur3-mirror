# Maintainer: perlawk <youremail@domain.com>
pkgname=sisal
pkgver=14.0.6
pkgrel=1
epoch=
pkgdesc="SISAL (Streams and Iteration in a Single Assignment Language) is a general-purpose single assignment functional programming language with strict semantics, implicit parallelism, and efficient array handling."
arch=('i686' 'x86_64')
url="http://sisal.sourceforge.net/"
license=('GPL')
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
install=sisal.install
changelog=
source=( http://nchc.dl.sourceforge.net/project/sisal/sisal-unix/bugfix-2/${pkgname}.${pkgver}.tgz)
noextract=()
md5sums=('bc45ac9b830b820b9d876058375c2a0d')

build() {
	mkdir -p "$pkgdir/usr/bin"
	cd "$srcdir/$pkgname".$pkgver
	sed -ie 's/ getline/ cgetline/g;' Frontend/Front1/sisal.c
	./configure --prefix=/$pkgdir/usr
	make
}

