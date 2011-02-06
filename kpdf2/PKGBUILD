# Maintainer: veox <veox at wre dot ath dot cx>
# Contributor: Nikita "dragon_djanic" Bukhvostov <dragon.djanic@gmail.com>

pkgname=kpdf2
pkgver=0.3.1
pkgrel=7
pkgdesc="An old version of KDE's PDF reader, made obsolete by Occular."
url="http://sourceforge.net/projects/kpdf2"
arch=('i686' 'x86_64')
license="GPL" 
depends=(kdelibs qt libpng libjpeg zlib)
makedepends=(pkgconfig doxygen perl)
conflicts=(kdegraphics)
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz \
  generator_pdf.h.patch)
md5sums=('2986bb22a692eb7e97d21bf0e69ce02f' 'e0d79996666ab1ac6ee983516a8e6fd9')

build() { 
  cd $srcdir/$pkgname-$pkgver

  echo "Patching generator_pdf.h..."
  patch ./kpdf/core/generator_pdf/generator_pdf.h $srcdir/generator_pdf.h.patch || return 1
  echo "Done patching!"

  ./configure --prefix=`kde-config --prefix` --with-qt-dir=/opt/qt --without-arts
  make || return 1 
  make DESTDIR=$startdir/pkg install 
}
