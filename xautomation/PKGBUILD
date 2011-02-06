# Contributor: raubkopierer <mail[dot]sensenmann[at]gmail[dot]com>

pkgname=xautomation
pkgver=1.03
pkgrel=1
pkgdesc="Controls X from the command line for scripts, and do 'visual scraping' to find things on the screen."
url="http://hoopajoo.net/projects/xautomation.html"
arch=('i686' 'x86_64')
license=('GPL')
source=(http://hoopajoo.net/static/projects/$pkgname-$pkgver.tar.gz)
md5sums=('91030079b0ecf96195dd21bcec635cb6')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr 
	make || return 1
        make DESTDIR=$startdir/pkg install	
}
