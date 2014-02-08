# Maintainer: Christos Nouskas <nous at archlinux dot us>
# 24 May 2010

pkgname=free-sa
pkgver=2.0.0b6p7
pkgrel=2
pkgdesc="Free-SA is statistic analyzer for daemons log files similar to SARG. Currently supported formats are squid v2, CERN/NCSA CLF, postfix v2, postfix, qmail, netcache, bluecoat and communigate v5."
arch=('i686' 'x86_64')
url="http://free-sa.sourceforge.net/"
license=('GPL3')
depends=()
makedepends=('gcc')
options=('strip')
source=(http://sourceforge.net/projects/free-sa/files/free-sa-dev/$pkgver/free-sa-$pkgver.tar.gz/download
	free-sa.install
	arch-fsh.patch)		# arch filesystem hierarchy
install=free-sa.install

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 -i $srcdir/arch-fsh.patch || return 1
  make
  make DESTDIR=$pkgdir install
}

# Package sums
sha256sums=('4f863c41b6fba8dd4f3d3a63ecd5fd24d5f863c9717855b15f52721d9771271f'
            'ef11d3b80d8410ec380b6d9629177c46c40f36a2f7f1d96db3b17d4dfb021397'
            'a06aef719773429c77c37df880c74162ca45451cf6f2fd7a7f57ee56a00ed5b2')
