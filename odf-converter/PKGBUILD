# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
# Maintainer: Ray Kohler <ataraxia937@gmail.com>
# Category: office

pkgname=odf-converter
pkgver=3.0
pkgrel=1
pkgdesc="An application for converting OOXML files to Oasis formats"
arch=('i686' 'x86_64')
url="http://odf-converter.sourceforge.net/"
license=('custom')
depends=('glib2' 'zlib')
makedepends=('mono')
source=(http://downloads.sourceforge.net/odf-converter/OdfAddinForOffice-src-$pkgver.zip
        archpatch-odf-converter-2.diff
        license_odf-converter)
md5sums=('6046ba273ab2d721894d5ce6552d37b7'
         'a9187bc2211f52a59448a809dafb497c'
         '33b0d045d6aee3445b153b32e45061bb')

build() {

  # Parallel make breaks this build
  unset MAKEFLAGS

  export MONO_SHARED_DIR=$startdir/src/.wabi
  mkdir -p $MONO_SHARED_DIR

  cd $startdir/src
  patch -p0 <$startdir/src/archpatch-odf-converter-2.diff
  cd $startdir/src/odf-converter-r5224/trunk/source/Common/OdfZipUtils
  make || return 1
  cd ../../Common/OdfConverterLib/
  make || return 1
  cd ../../Word/Converter/
  make || return 1
  cd ../../Presentation/Converter/
  make || return 1
  cd ../../Spreadsheet/Converter/
  make || return 1
  cd ../../Shell/OdfConverter
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  mkdir $startdir/pkg/usr/bin
  ln -sf /usr/lib/ooo-2.0/program/OdfConverter $startdir/pkg/usr/bin/odf-converter

  install -D -m644 $startdir/src/license_odf-converter $startdir/pkg/usr/share/licenses/odf-converter/COPYING
}
