pkgname=hdl_dump
pkgver=0.8.6
pkgrel=1
pkgdesc="Game installer for PS2's HD Loader"
url="http://openps2loader.info/hdldump/"
license=('GPL')
arch=('i686' 'x86_64')
source=(http://openps2loader.info/hdldump/hdl_dumx-0.8.6-20060901-src.tar.bz2
		hdl_dump.install)
md5sums=('fb776d11c516e5cb7ead6eb3b0c7c3e0'
		 'b0e5ec62b897651a5432d785f590022b')
install=$pkgname.install

build() {
	cd $pkgname
	make
	install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
