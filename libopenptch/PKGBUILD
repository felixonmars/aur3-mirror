# Contributor: Evgeny Grablyk <sm@linuxforum.org.ua>
pkgname=libopenptch
pkgver=1.18_RC5
pkgrel=1
pkgdesc="An advanced feature-rich binary manipulation library"
arch=(i686)
url="http://sourceforge.net/projects/libopenptch/"
license=('GPL')
source=(http://downloads.sourceforge.net/libopenptch/OpenPtch_$pkgver.rar)
md5sums=('3d01b04b2347d9091e34709baef0f41b')
builddepends=('unrar')

build() {
	cd $startdir/src/ 
	unrar x -o+ OpenPtch_$pkgver.rar > /dev/null || return 1 
	cd src || return 1 
	rm main.{c,h} || return 1
	gcc -fPIC -g -c -Wall *.c || return 1
	gcc -shared -Wl -o $pkgname.so *.o -lc || return 1
	install -d $startdir/pkg/usr/lib/ || return 1
	install $pkgname.so $startdir/pkg/usr/lib/ || return 1
	ldconfig -n /usr/lib/ || return 1
	}
