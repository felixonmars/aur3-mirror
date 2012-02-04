pkgname=unitpp
pkgver=1.2.4
pkgrel=1
pkgdesc="a C++ unit testing framework similar to junit"
url="http://unitpp.sourceforge.net/"
license=""
conflicts=()
replaces=()
backup=()
install=
source=(http://heanet.dl.sourceforge.net/sourceforge/unitpp/unit++-${pkgver}.tgz)
md5sums=('52e1b88f5cf2538ae503edc04747c8e6')

build() {
	cd $startdir/src/unit++
	./configure --prefix=/usr --sysconfdir=/etc
	make || return 1
	make prefix=$startdir/pkg/usr install || return 1
}
