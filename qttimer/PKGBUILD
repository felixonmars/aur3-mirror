pkgname=qttimer
pkgver=1.0
pkgrel=2
pkgdesc="Simple timer/stopwatch that uses the Qt framework."
arch=('i686' 'x86_64')
url="http://terra-byte.org/"
license=('GPL3')
source=('http://terra-byte.org/sites/default/files/projects/qttimer/qttimer-1.0.tar.bz2')
md5sums=('53ab1a9fde511db3f73d755bd8e799a8')
depends=('qt')

build() {
	cd $srcdir
	qmake Timer.pro -r -spec linux-g++
	make
	install -Dm 755 Timer $pkgdir/usr/bin/qttimer
}

