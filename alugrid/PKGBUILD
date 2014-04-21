# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=alugrid
pkgver=1.52
pkgrel=1
#epoch=
pkgdesc="ALUgrid"
arch=('i686' 'x86_64')
url="http://aam.mathematik.uni-freiburg.de/IAM/Research/alugrid/"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=('metis' 'parmetis')
provides=('alugrid')
conflicts=()
replaces=()
backup=()
options=(staticlibs libtool)
# install=
# changelog=
source=(http://aam.mathematik.uni-freiburg.de/IAM/Research/alugrid/ALUGrid-${pkgver}.tar.gz)
noextract=()
md5sums=(393c3d8ac1e9def4280765b16b95f5f1) #generate with 'makepkg -g'

# prepare() {
# 	cd "$srcdir/$pkgname-$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

build() {
	cd "$srcdir/ALUGrid-$pkgver"
        CXXFLAGS="-std=c++0x -DNDEBUG"
        CCFLAGS="-DNDEBUG"
        CFLAGS="-DNDEBUG"
	./configure --prefix=/usr --with-metis=/usr/ 
	make 
}

# check() {
# 	cd "$srcdir/$pkgname-$pkgver"
# 	make -k check
# }

package() {
	cd "$srcdir/ALUGrid-$pkgver"
	make install DESTDIR="$pkgdir/" 
}
