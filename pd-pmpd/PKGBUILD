# $Id$
# Maintainer: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: Bernardo Barros <bernardobarros@gmail.com>

# need work

pdname=pmpd
pkgname=pd-$pdname
pkgver=0.9
pkgrel=3
pkgdesc="Physical Modelling PureData"
arch=('i686' 'x86_64')
url="http://www.puredata.org/"
depends=('pd')
license=('GPL2')
groups=('pd-externals')
source=("http://downloads.sourceforge.net/project/pure-data/libraries/pmpd/pmpd-0.9.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fsettings%2Fmirror_choices%3Fprojectname%3Dpure-data%26filename%3Dlibraries%2Fpmpd%2Fpmpd-0.9.tar.gz&ts=1295985545&use_mirror=voxel" "Makefile")

md5sums=('bd0ac6036aa1982aa3f6f3796bead46c'
         '473372504b6d0ff5e8070f512e480fe6')

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
