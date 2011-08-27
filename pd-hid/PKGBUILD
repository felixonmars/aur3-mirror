# $Id$
# Maintainer: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pdname=hid
pkgname=pd-$pdname
pkgver=0.7
pkgrel=2
pkgdesc="An extension library for Pure Data, providing video and other media processing functionality."
arch=('i686' 'x86_64')
url="http://www.puredata.org/"
depends=('pd')
license=('GPL2')
groups=('pd-externals')
source=(http://sourceforge.net/projects/pure-data/files/libraries/hid/hid-0.7.tar.gz/download Makefile)

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

md5sums=('ed14b51d1671eb90345661b6ce5a7c46'
         '94fae72fc80fc441b785d421ec67016d')

