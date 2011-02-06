# $Id$
# Maintainer: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pdname=pdp
pkgname=pd-$pdname
pkgver=0.12.6
pkgrel=2
pkgdesc="An extension library for Pure Data, providing video and other media processing functionality."
arch=('i686' 'x86_64')
url="http://www.puredata.org/"
depends=('pd')
license=('GPL2')
groups=('pd-externals')
source=(http://sourceforge.net/projects/pure-data/files/libraries/$pdname/$pdname-$pkgver.tar.gz)

build() {

  cd $srcdir/$pdname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pdname}-${pkgver}"
  make DESTDIR=$startdir/pkg install
}

md5sums=('d0e3649bc20d119f2fc0b41ea1aeb8b3')
