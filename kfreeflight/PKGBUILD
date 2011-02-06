pkgname=kfreeflight
pkgver=0.3.2
pkgrel=4
pkgdesc="KFreeFlight is a FlightGear GUI-frontend designed for KDE users. It can launch FlightGear with the most options without writting a very long command line."
url="http://kfreeflight.sourceforge.net/"
makedepends=('bash' 'simgear' )
depends=( 'glibc' 'zlib' 'plib' 'kdelibs' 'qt' 'freeglut' )
source=( http://switch.dl.sourceforge.net/sourceforge/kfreeflight/kfreeflight-0.3.2-r2.tar.gz )
md5sums=( '401ed177fba2bedc29260e09d31c0288'  )

build() {			     
	cd $startdir/src/$pkgname-$pkgver
	./configure  
	make || return 1
	make DESTDIR=$startdir/pkg install
}
