#Maintainer: Sébastien Duquette <ekse.0x@gmail.com>
#Contributor: Dawid Wrobel <cromo@klej.net>
pkgname=tcpreplay
pkgver=3.4.4
pkgrel=2
pkgdesc="Gives the ability to replay previously captured traffic in a libpcap format"
url="http://tcpreplay.synfin.net"
arch=('i686' 'x86_64')
license=("GPL")
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://downloads.sourceforge.net/sourceforge/tcpreplay/${pkgname}-${pkgver}.tar.gz")
md5sums=('22725feb9b2590809f9350308ec65180')

build() {
     cd $startdir/src/$pkgname-$pkgver
     sed -in 's/libext\=a/libext\=so/g' configure
     ./configure --prefix=/usr
     make || return 1
}

package() {
     cd $startdir/src/$pkgname-$pkgver
     make DESTDIR=$startdir/pkg install
}
