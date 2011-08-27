pkgname=cal-unicorn
arch=('i686 x86_64')
pkgver=4.0
pkgrel=1
pkgdesc="substitute unix \"cal\" command"
url="http://unicorn.us.com/cal.html"
license='GPL'
source=("http://unicorn.us.com/pub/cal40.zip")
md5sums=('412c8bbc6f768a5bb86f8c42e796c41e')
makedepends=('unzip' 'gcc' 'make')
options=('zipman')

build() {
	cd $srcdir/cal40/src
	chmod 644 *
	make -f makefile.unx || return 1
	install -Dps -m755 cal $pkgdir/usr/bin/$pkgname
	install -Dp -m644 cal.1 $pkgdir/usr/share/man/man1/$pkgname.1
} 
