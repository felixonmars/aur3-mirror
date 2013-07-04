# Contributor: bender02 at archlinux dot us
#  - build-fix from Sergey Pupykin
pkgname=installwatch
pkgver=0.7.0beta7
pkgrel=1
pkgdesc="A simple utility which keeps track of which files are created and modified during the installation of a new program"
_main_prog=checkinstall
_main_prog_ver=1.6.2
source=(http://asic-linux.com.mx/~izto/checkinstall/files/source/$_main_prog-$_main_prog_ver.tar.gz \
        build-fix.patch)
url="http://asic-linux.com.mx/~izto/checkinstall/installwatch.html"
license=('GPL2')
arch=('i686' 'x86_64')
conflicts=('checkinstall')
md5sums=('d7b43c92001e68243a93bcce8b1e5480'
         'eac0c843781c300e7bc15c55be262e51')

build() {
  cd $srcdir/$_main_prog-$_main_prog_ver
  patch -Np1 < $srcdir/build-fix.patch
  cd $pkgname
  make
}

package() {
  #install -d $pkgdir/usr/{bin,lib}
  cd $srcdir/$_main_prog-$_main_prog_ver/$pkgname
  make PREFIX=$pkgdir/usr install
}
