# Contributor: solsTiCe d'Hiver <solstice.dhiver@gmail.com>

pkgname=libtpl
pkgver=1.5
pkgrel=1
pkgdesc="a library for serializing C data"
arch=(i686 x86_64)
url="http://tpl.sourceforge.net"
license=(custom:'BSD3 modified')
source=(http://downloads.sourceforge.net/tpl/libtpl-$pkgver.tar.bz2)
md5sums=('9408276cb0ffe9cb6bec99f923b24ebd')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir install
	mkdir -p $pkgdir/usr/{bin,lib/perl5/current,share/licenses/libtpl}
	install -m 755 lang/perl/tpl{fmt,xml} $pkgdir/usr/bin
	install -m 644 lang/perl/Tpl.pm $pkgdir/usr/lib/perl5/current
	install -m 644 LICENSE $pkgdir/usr/share/licenses/libtpl
}

