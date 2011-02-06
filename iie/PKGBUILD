# Contributor: William Rea <sillywilly@gmail.com>
# formerly maintained by tardo

pkgname=iie
pkgver=0.0.3
pkgrel=2
pkgdesc="Image Information Extractor"
arch=('i686' 'x86_64')
url="http://www.sourcefiles.org/Graphics/Tools/"
license=('GPL')
depends=('gtk-sharp-2' 'libexif')
makedepends=('intltool' 'perlxml')
source=(http://www.sourcefiles.org/Graphics/Tools/Conversion/iie-$pkgver.tar.gz)
md5sums=('ece71264a710fd096bb38dfac96f3806')

build() {
  export MONO_SHARED_DIR=$srcdir/.wabi
  install -d $MONO_SHARED_DIR
  cd $srcdir/iie-$pkgver
  find . -name Makefile.in -exec sed -i -e 's/-scrollkeeper-update.*//' {} \;
  if [ -f omf.make ]; then
    sed -i -e 's/-scrollkeeper-update.*//' omf.make
  fi
  ./configure --prefix=/usr --mandir=/usr/share/man || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  rm -rf $MONO_SHARED_DIR 
}
