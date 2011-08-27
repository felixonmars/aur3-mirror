# $Id$
# Maintainer: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pdname=list-abs
pkgname=pd-$pdname
pkgver=0.1
pkgrel=3
pkgdesc="A collection of list-processing abstractions for Pd."
pkgdesc="Externals for PureData"
arch=('i686' 'x86_64')
url="http://www.puredata.org/"
depends=('pd')
license=('GPL2')
groups=('pd-externals')
source=(http://sourceforge.net/projects/pure-data/files/libraries/$pdname/$pdname-$pkgver.tar.gz Makefile)

build() {

  cd "${srcdir}/${pdname}-${pkgver}"
  mv Makefile Makefile.old
  cp $startdir/Makefile "${srcdir}/${pdname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pdname}-${pkgver}"
  make DESTDIR=$startdir/pkg install
}

md5sums=('7247bfc96c5f86efa0a82b8eeffb586e'
         '5c537f89fe72b191eb9503a73076a91a')
