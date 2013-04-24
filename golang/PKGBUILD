# Maintainer: Illarion Kovalchuk <illarion.kovalchuk@gmail.com>)
pkgname=golang
pkgver=1.0.3
pkgrel=1
epoch=
pkgdesc="The Go Programming Language"
arch=('x86_64')
url="http://golang.org"
license=('BSD')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=(gcc)
provides=(go golang)
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=(http://go.googlecode.com/files/go$pkgver.linux-amd64.tar.gz go.sh)
noextract=(go$pkgver.linux-amd64.tar.gz)
#generate with 'makepkg -g'
md5sums=('95e249599e6bc48b89c874b92517e4de'
         'b3bf1b9e2c6e72a270357cb56cc05898')

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
	#cd "$srcdir/$pkgname-$pkgver"
	#make DESTDIR="$pkgdir/" install
        mkdir -p $pkgdir/usr/share
	tar -C $pkgdir/usr/share -xzf go$pkgver.linux-amd64.tar.gz
	install -D go.sh $pkgdir/etc/profile.d/go.sh
}
