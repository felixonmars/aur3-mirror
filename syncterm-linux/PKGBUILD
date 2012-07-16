#Maintained by ivoarch <ivayloarch@gmail.com>  
pkgname=syncterm-linux
pkgver=0.9.5b
pkgrel=2
pkgdesc="is a BBS terminal program. (Binary Version)"
url="http://syncterm.bbsdev.net"
license="GPL"
depends=('ncurses')
arch=('i686')
source=(http://syncterm.bbsdev.net/syncterm-linux.gz)
md5sums=('b91171b33151baac08109744d3877b6d')
 
build() {
	mkdir -p ${pkgdir}/usr/bin
	cp ${srcdir}/syncterm-linux ${pkgdir}/usr/bin/ 
        chmod 755 $pkgdir/usr/bin/$pkgname 
}

