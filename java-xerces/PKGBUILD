# Contributor: Mathieu clabaut <mathieu.clabaut@gmail.com>
pkgname=java-xerces
pkgver=2.9.0
pkgrel=1
pkgdesc="High performance fully compliant Java XML parser"
url="http://xml.apache.org/xerces-j"
license=("Apache")
arch=('i686' 'x86_64')
depends=('java-runtime')
source=(http://archive.apache.org/dist/xml/xerces-j/Xerces-J-bin.$pkgver.tar.gz)
md5sums=('138f2d1cddd823281d5dfb700f2bd7d4')


build() {
  mkdir -p $startdir/pkg/usr/share/java/xerces
  cd $startdir/src/xerces-2_9_0
  rm xercesSamples.jar
  cp *.jar $startdir/pkg/usr/share/java/xerces
}
