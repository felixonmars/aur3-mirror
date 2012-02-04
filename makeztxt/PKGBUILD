# Contributor: maniac <maniac@pzskc383.dp.ua>
pkgname=makeztxt
pkgver=1.62
pkgrel=1
pkgdesc="zTXT maker for PalmOS reader"
arch=( "i686" )
url="http://gutenpalm.sourceforge.net/"
license=('GPL')
groups=()
depends=( "zlib" )
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=
source=("http://garr.dl.sourceforge.net/sourceforge/gutenpalm/$pkgname-$pkgver-src.tar.gz")
noextract=()
md5sums=('81b44b72894248b7e579592e650f1da4')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	# enabling posix regexps
	sed -i 's/#USEPOSIX/USEPOSIX/' Makefile
	make || return 1
	# Makefile doesnt have install section
	mkdir -p $pkgdir/usr/bin
	install -m 755 makeztxt $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/doc/$pkgname
	install -m 644  .makeztxtrc $pkgdir/usr/share/doc/$pkgname/sample.makeztxtrc
	install -m 644 README $pkgdir/usr/share/doc/$pkgname
	install -m 644 ChangeLog $pkgdir/usr/share/doc/$pkgname
}
