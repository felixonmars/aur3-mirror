# Contributor: Georgij Kondratjev <smpuj@bk.ru>
pkgname=cups-lexmark-700
pkgver=1.1.1
pkgrel=1
pkgdesc="Lexmark Z700/P700/P3150 Printer Driver"
makedepends=('rpmunpack' 'cpio' 'gzip' 'bash')
depends=('libstdc++5' 'libcups')
conflicts=('z700')
replaces=('z700')
url="http://www.lexmark.com/"
arch=('i686')
source=(http://users.cybercity.dk/~dko12479/z700llpddk-2.0-1.i386.rpm \
        http://users.cybercity.dk/~dko12479/lexmark-z700-cups-driver-$pkgver-1.i586.rpm)

md5sums=('04785609851f6993a357e0fa685508b1'
         '0de30f8a2a9a8992d3c9c2e5855a1770')

build() {
  cd $startdir/src
  rpmunpack z700llpddk-2.0-1.i386.rpm
  rpmunpack lexmark-z700-cups-driver-$pkgver-1.i586.rpm
  cd $startdir/pkg
  mkdir -p ./usr/lib/cups/backend/
  mkdir -p ./usr/lib/cups/filter/
  mkdir -p ./usr/share/cups/model/
  mkdir -p ./usr/local/z700llpddk/
  mkdir -p ./usr/include/lexmark/
  mkdir -p ./usr/local/z700llpddk/utility/
  zcat $startdir/src/z700llpddk-2.0-1.cpio.gz | cpio -i
  zcat $startdir/src/lexmark-z700-cups-driver-1.1.1-1.cpio.gz | cpio -i
  chmod 644 ./usr/include/lexmark/*
  rm -rf ./usr/include
  rm -rf ./usr/local/z700cups
  find . -name '*.la' -exec rm {} \;
}
