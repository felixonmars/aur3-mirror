# Contributor: Peter Kosyh <p.kosyhgmail.com>
pkgname=synodal
pkgver=0.5
pkgrel=1
pkgdesc="Synodal and Slavic Bible in console"
arch=('i686' 'x86_64')
url="http://synodal.sourceforge.net"
license=('GPL')

makedepends=( 'perl' )

source=(https://downloads.sourceforge.net/project/synodal/synodal/synodal-$pkgver.tar.gz)
md5sums=(4ede8b38b226fcfc25d35e8c920aec67)
optdepends=('tk: tksynodal gui')

build() {
cd $startdir/src/synodal-$pkgver
make PREFIX=/usr || return 1.
make PREFIX=/usr DESTDIR=${startdir}/pkg install
}
