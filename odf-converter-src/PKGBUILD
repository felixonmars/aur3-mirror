# Contributor: SeeSchloss <seeschloss@seos.fr>
arch=(i686 x86_64)
pkgname=odf-converter-src
pkgver=1.1.1
pkgrel=2
pkgdesc="Command-line OpenXML to OpenOffice formats translator (supports docx <-> odt, pptx <-> odp and xlsx <-> ods)"
url="http://odf-converter.sourceforge.net"
depends=(zlib glib2)
makedepends=(mono)
provides=(odf-converter)
conflicts=(odf-converter)
source=(http://download.go-oo.org/tstnvl/odf-converter/SOURCES/odf-converter-$pkgver-1/odf-converter-$pkgver.tar.gz odf-converter-mono-path.patch)
md5sums=('783ac63b4cb455de20ae8df4d01a276f' '07658b0892b18a123c9704db8b11bdf6')
license=('BSD')

build() {
  cd $startdir/src/odf-converter-$pkgver
  patch -p0 < ../../odf-converter-mono-path.patch || return 1
  make || return 1
  install -D --strip $startdir/src/odf-converter-1.1.1/source/Shell/OdfConverterTest/OdfConverter $startdir/pkg/usr/bin/OdfConverter
  ln -s $startdir/pkg/usr/bin/{OdfConverter,odf-converter}
}
