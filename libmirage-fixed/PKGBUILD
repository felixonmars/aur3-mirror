# $Id: PKGBUILD 56986 2011-10-17 16:29:39Z bpiotrowski $
# Maintainer: Mateusz Herych <heniekk@gmail.com>
# Contributor: Charles Lindsay <charles@chaoslizard.org>

pkgname=libmirage-fixed
_pkgname=libmirage
pkgver=1.5.0
pkgrel=1
pkgdesc="CD-ROM image (B6T/CCD/CDI/CUE/ISO/MDS/NRG/TOC) access library version 1.5"
arch=('i686' 'x86_64')
url="http://cdemu.sourceforge.net/"
license=('GPL')
depends=('glib2' 'libsndfile')
makedepends=('bison' 'flex')
source=(http://downloads.sourceforge.net/cdemu/$_pkgname-$pkgver.tar.bz2)
options=(!libtool)
md5sums=('b60d9baa754efee6e0f6a584ec033fff')
provides=('libmirage')
replaces=('libmirage')
conflicts=('libmirage')

build() {
  cd $srcdir/$_pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
