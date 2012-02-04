# Contributor: Markku (rasat at Arch Linux Forum)
# http://bbs.archlinux.org

pkgname=prima
pkgver=1.26
pkgrel=1
pkgdesc="A Perl toolkit for multi-platform GUI development."
depends=('perl' 'libpng' 'libjpeg' 'lesstif' 'libungif' 'libtiff' 'x-server')
source=(http://www.prima.eu.org/download/Prima-$pkgver.tar.gz)
url="http://www.prima.eu.org/"
install=prima.install
md5sums=('c22a20d40f5321462a7be98e53a7f5a6')
arch=(i686)
license=('GPL')

build() {
  cd $startdir/src/Prima-$pkgver
  perl Makefile.PL PREFIX=$startdir/pkg/usr
  make || return 1
  make install 
}
