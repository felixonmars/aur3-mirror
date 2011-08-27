# Contributor: <arlekino.zirk@gmail.com>
pkgname=jodconverter
pkgver=2.2.2
pkgrel=2
pkgdesc="Java OpenDocument Converter, converts documents between different office formats (batch converting; command line tool)."
arch=('i686' 'x86_64')
url="http://www.artofsolving.com/opensource/jodconverter"
license=('LGPL')
depends=('libreoffice' 'java-runtime')
makedepends=('unzip')
install='jodconverter.install'
source=(http://downloads.sourceforge.net/project/jodconverter/JODConverter/2.2.2/jodconverter-2.2.2.zip
    $pkgname.sh)

build() {
  cd $srcdir
  install -m755 -vd $pkgdir/usr/share/java/jodconverter
  install -m644 -vt $pkgdir/usr/share/java/jodconverter $pkgname-$pkgver/lib/*.jar
  install -m755 -vD $pkgname.sh $pkgdir/usr/bin/$pkgname
}

md5sums=('dc01b8607118b4f50ce2d3c7f15a9241'
         '686cae76dd2497f03fe9ed1e96e3cf54')
