#Contributor: figo.zhang <figo1802@gmail.com>
pkgname=smartirc4net
pkgver=0.4.5.1
pkgrel=1
pkgdesc="SmartIrc4net is a multi-threaded and thread-safe IRC library written in C#"
url="http://smartirc4net.meebey.net/jaws/"
license="GPL"
arch=('i686' 'x86_64')
depends=('mono' 'log4net')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.smuxi.org/jaws/data/files/smartirc4net-$pkgver.tar.gz)
md5sums=('a0f091d3796e6dce4c5158d973a937ee')

build() {
	cd $srcdir/smartirc4net-$pkgver
	./configure

	make || return 1
	make DESTDIR="$pkgdir/" install

}

