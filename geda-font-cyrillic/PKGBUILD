pkgname=geda-font-cyrillic
pkgver=20060127
pkgrel=2
pkgdesc="Cyrillic vector font with Russian and Ukrainian glyphs for gEDA/GAF Project"
url="http://lostclus.linux.kiev.ua/Projects/geda-font-cyrillic"
depends=('geda-suite')
source=()
md5sums=('c202c4520c6ed38ddde00c7b27b44305')
arch=('i686' 'x86_64')
license=(GPL)
backup=(/usr/share/gEDA/system-gafrc)
install=install.$pkgname

build ()
{

	# Bad link, use wrap-around
	cd $startdir
	if [ -e $pkgname-$pkgver.tar.bz2 ]; then	
		cp $pkgname-$pkgver.tar.bz2 ./src
	fi

	cd $startdir/src
	
	if [ ! -e $pkgname-$pkgver.tar.bz2 ]; then	
		wget -c -O $pkgname-$pkgver.tar.bz2 \
		     "http://lostclus.linux.kiev.ua/Projects/geda-font-cyrillic?action=AttachFile&do=get&target=$pkgname-$pkgver.tar.bz2"
	fi

	tar xjf $pkgname-$pkgver.tar.bz2

	cd $startdir/src/$pkgname-$pkgver/
	./configure --prefix=/usr
	make
	make DESTDIR=$startdir/pkg install
}
