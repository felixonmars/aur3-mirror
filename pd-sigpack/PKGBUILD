# $Id$
# Maintainer: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pdname=sigpack
pkgname=pd-$pdname
pkgver=0.0.4.2
pkgrel=2
pkgdesc="External for PureData"
arch=('i686' 'x86_64')
url="http://www.puredata.org/"
depends=('pd')
license=('GPL2')
groups=('pd-externals')
source=(http://sourceforge.net/projects/pure-data/files/libraries/$pdname/$pdname_pkgver.tar.gz Makefile)

build() {

  cd $srcdir/$pdname-$pkgver
  mv Makefile Makefile.old
  cp $startdir/Makefile "${srcdir}/${pdname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pdname}-${pkgver}"
  make DESTDIR=$startdir/pkg install
}

md5sums=('5e87f971352ce07899ffbb04e98ca300'
         'e66b32fb707c258dbcba80a9044a4cc6')
