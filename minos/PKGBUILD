# Contributor: quasi <quasi@aur.archlinux.org>

pkgname=minos
pkgver=1
pkgrel=1
pkgdesc="Minos is a program that can store information about many objects and manage them is a way that allows for easy processing."
arch=('i686' 'x86_64')
url="http://www.nikhef.nl/~form/"
license=(custom:FORM)
md5sums=('0ec56651056677e21b3db7099dbbb23f' '4987dcb51d634917a57dfa7fa9a84443' '0b545e19129bd5107b35ce2c8953c44b' )


source=(http://www.nikhef.nl/~form/maindir/others/minos/minosdir.tar.gz
		license
		minos.install
		)

build() {
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/doc/minos
	
	cd $srcdir/minosdir || return 1
	make -f makefile || return 1
	
	cp -f $srcdir/minosdir/$pkgname $pkgdir/usr/bin/ || return 1
	cp -f $srcdir/minosdir/$pkgname.pdf $pkgdir/usr/share/doc/$pkgname || return 1
	cp -f $srcdir/minosdir/$pkgname.ps $pkgdir/usr/share/doc/$pkgname || return 1
	cp -f $srcdir/minosdir/$pkgname.tex $pkgdir/usr/share/doc/$pkgname || return 1
	
	
}
