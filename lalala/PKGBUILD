# Contributor: Simon Goller <neosam@gmail.com>

pkgname=lalala
pkgver=0.00.90
pkgrel=2
pkgdesc="An adventure in curses."
arch=('i686' 'x86_64')
url="http://neosam.github.com/bttext"
license=('GPL')
groups=('games')
depends=('python>=2.5')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://cloud.github.com/downloads/neosam/bttext/$pkgname-$pkgver.tgz)
noextract=()
md5sums=('1fedf72a2f0b80cf66f63ee3386820bf')

build() {
	cd $srcdir/$pkgname-$pkgver
	mkdir -p $pkgdir/usr/share/lalala/ || return 1
	mkdir -p $pkgdir/usr/bin/ || return 1
	cp -r * $pkgdir/usr/share/lalala/ || return 1
	cp lalala.sh $pkgdir/usr/bin/ || return 1
	echo $pkgdir
	ls $pkgdir
}
