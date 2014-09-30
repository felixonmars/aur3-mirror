# Maintainer: Guillaume Maudoux <layus DOT on @T gmail DOT com>

pkgname=mozart2-bin
pkgver=2.0.0.alpha.0.4105.5c06ced
pkgrel=1
pkgdesc="The Mozart programming system, reference implementation for the Oz programming language"
url="http://mozart.github.io/"
arch=('x86_64')
license=('GPL')
depends=('tk>=8.5')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('mozart' 'mozart-git' 'mozart2-git')
replaces=()
backup=()
options=()
install=
changelog=
_tarname='mozart2-2.0.0-alpha.0+build.4105.5c06ced-x86_64-linux'
source=("http://downloads.sourceforge.net/mozart-oz/${_tarname}.tar.gz")
noextract=()
md5sums=('20508ff3ab0b183f1d100e7947a3f77a')

#prepare() {
#	cd "$srcdir/$pkgname-$pkgver"
#}

#build() {
#	cd "$srcdir/$pkgname-$pkgver"
#	./configure --prefix=/usr
#	make
#}

#check() {
#	cd "$srcdir/$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$srcdir/$_tarname"
    mkdir $pkgdir/usr
    mv {bin,share} $pkgdir/usr
	#make DESTDIR="$pkgdir/" install
}

