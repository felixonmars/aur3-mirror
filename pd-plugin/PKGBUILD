# $Id$
# Maintainer: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pdname=plugin~
pkgname=pd-plugin
pkgver=0.2.1
pkgrel=2
pkgdesc="External for PureData"
arch=('i686' 'x86_64')
url="http://www.puredata.org/"
depends=('pd')
license=('GPL2')
groups=('pd-externals')
source=(http://sourceforge.net/projects/pure-data/files/libraries/$pdname/$pdname-$pkgver.tar.gz Makefile SConstruct)

build() {

  cd $srcdir/$pdname-$pkgver
  mv Makefile Makefile.old
  mv SConstruct SConstruct.old
  cp $startdir/Makefile "${srcdir}/${pdname}-${pkgver}"
  cp $startdir/SConstruct "${srcdir}/${pdname}-${pkgver}"

  make
}


package() {
  cd "${srcdir}/${pdname}-${pkgver}"
  make DESTDIR=$startdir/pkg install
}

md5sums=('b617efab88369d0d0d7550e8e08c2a81'
         '1340b2d40201598b7ff76867e018aba2'
         'b0fb01c3735c0eeaca14e461d4866c99')
