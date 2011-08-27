# Contributor: Sergio Montesinos <sermonpe@yahoo.es>
# For Lexmark z25 and z35

pkgname=cjlz35le-cups
pkgver=2.0_1
pkgrel=1
pkgdesc="Lexmark z35 printer driver for CUPS"
arch=('i686')
makedepends=('rpmunpack' 'cpio' 'gzip' 'bash')
depends=('cups')
license=('custom')
url="http://www.lexmark.com/"
source=(http://www.downloaddelivery.com/srfilecache/CJLZ35LE-CUPS-2.0-1.TAR.GZ)
md5sums=('7260179dce18bef4e50ba06eef51a496')

build() {
  cd $startdir/src
  tar xzf CJLZ35LE-CUPS-2.0-1.TAR.GZ
  chmod u+x z35cups-2.0-1.gz.sh
  ./lexmarkz35-CUPS-2.0-1.gz.sh -target target
  cd target
  rpmunpack z35llpddk-2.0-2.i386.rpm
  rpmunpack lexmarkz35-CUPS-2.0-1.i386.rpm
  gzip -d lexmarkz35-CUPS-2.0-1.cpio.gz
  gzip -d z35llpddk-2.0-2.cpio.gz
  cd $startdir/pkg
  mkdir -p ./usr/lib/cups/backend/
  mkdir -p ./usr/lib/cups/filter/
  mkdir -p ./usr/share/cups/model/
  mkdir -p ./usr/local/z35llpddk/
  mkdir -p ./usr/include/lexmark/
  mkdir -p ./usr/local/z35llpddk/utility/
  cpio -i < $startdir/src/target/lexmarkz35-CUPS-2.0-1.cpio
  cpio -i < $startdir/src/target/z35llpddk-2.0-2.cpio
}
