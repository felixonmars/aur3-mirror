# Contributor: Mikko Sysikaski <mikko dot sysikaski at gmail dot com>
pkgname=coinor-all
pkgver=1.4.0
pkgrel=1
pkgdesc="COIN-OR project CoinAll distribution"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/"
license=('CPL')
depends=()
makedepends=('gcc' 'gcc-fortran' 'blas')
source=()
md5sums=()
conflicts=('osi')
provides=('osi')

trunk=https://projects.coin-or.org/svn/CoinBinary/CoinAll/releases/$pkgver
mod=coin-$pkgver

build() {
	cd $srcdir

	if [ -d $mod/.svn ]; then
		(cd $mod && svn up)
	else
		svn co $trunk $mod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	rm -rf $srcdir/$mod-build
	svn export $mod $mod-build
	cd $mod-build || return 1

	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir install
}
