
# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Ezra Varady<ezra@indico.io>
pkgname=pixelpulse2
pkgver='.1'
pkgrel=1
epoch=
pkgdesc="Software interface for the ADALM1000"
arch=('x86_64')
url="https://github.com/signalspec/pixelpulse2"
license=('GPL')
depends=('qt5-base' 'qt5-quick1' 'qt5-quickcontrols')
makedepends=('qt5-base' 'qt5-quick1' 'qt5-quickcontrols')
optdepends=()
provides=('pixelpulse2')
conflicts=()
source=($pkgname-$pkgver.tar.gz)
md5sums=('9416a6359e062c72474b590a8537484e')
#md5sums=(58367a281777222a0ea460a4d6f31e10) #generate with 'makepkg -g'
prepare() {
	cd "$srcdir/$pkgname-$pkgver"
    mkdir build
	#patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
    cd build
    qmake ..
    make
	#./configure --prefix=/usr
	#make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
    install "$srcdir/$pkgname-$pkgver/build/pixelpulse2" /usr/bin
    #pwd
	#cp $pkgname "$pkgdir/"
}
