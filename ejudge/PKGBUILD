# Maintainer: Ignat Loskutov <ignat.loskutov@gmail.com>
# Contributor: Alexander Shuklin <jasuramme@mail.ru>

pkgname=ejudge
pkgver=3.3.1
pkgrel=0
pkgdesc="Online programming competitions server"
arch=('i686' 'x86_64')
url="http://ejudge.ru/"
license=('GPL')
depends=(sendmail make gcc glibc bison flex gawk sed zlib ncurses expat libzip gettext curl util-linux)
makedepends=()
optdepends=(	'fpc: pascal compiler'
		'ruby: ruby compiler'
		'python: python compiler. look for old versions as well'
		'php: php interpreter'
		'perl: perl compiler'
		'racket: drscheme compiler'
		'gprolog: prolog compiler'
		'mono: mono C# ompiler'
		'jdk7-openjdk: java sdk kit'
		'gcc-fortran: fortran compiler')
backup=()
install=.post_install
changelog=
source=($pkgname-$pkgver.zip::https://github.com/blackav/$pkgname/archive/v$pkgver.zip)
#https://github.com/blackav/ejudge/archive/v3.3.1.zip
md5sums=('af5b80b169fee58b88e277b71837b460')
prepare() {
	[ -d $srcdir/$pkgname-$pkgver ] && rm -r $srcdir/$pkgname-$pkgver
	#mv $srcdir/ejudge $srcdir/$pkgname-$pkgver
        unzip $pkgname-$pkgver.zip
	cd "$srcdir/$pkgname-$pkgver"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make -j1
	}


package() {
	mkdir -p $pkgdir/usr/bin
	mv $srcdir/$pkgname-$pkgver/ejudge-setup $pkgdir/usr/bin/.ejudge-setup
	touch $srcdir/$pkgname-$pkgver/ejudge-setup
	chmod +755 $srcdir/$pkgname-$pkgver/ejudge-setup
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	rm $pkgdir/usr/bin/ejudge-setup
	mv $pkgdir/usr/bin/.ejudge-setup $pkgdir/usr/bin/ejudge-setup
        mv -f $pkgdir/usr/lib64/* $pkgdir/usr/lib
	[ -d $pkgdir/usr/lib64 ] && rm -rf $pkgdir/usr/lib64
}
