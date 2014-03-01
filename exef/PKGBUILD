#Contributor: Johannes Martin <dorhonzor@gmail.com>
pkgname=exef
pkgver=1.7.0
pkgrel=3
arch=('i686' 'x86_64')
license=('GPL')
depends=('bash')
pkgdesc="Real Time DSP effect engine"
url="http://sourceforge.net/projects/exef"
source=(http://downloads.sourceforge.net/project/exef/exef/initial%20sourceforge%20release/ExEf-1.7.0.tar.gz)
md5sums=(b4da70fcde930ace584903323fef39b0)

build() {
  cd $srcdir/ExEf-V170
  gcc ExEfDSP.c -O2 -lm -Wall -oExEfDSP
}

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/ExEf-V170/ExEfDSP $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/ExEf
  cp $srcdir/ExEf-V170/ExEf $pkgdir/usr/bin/
  cp $srcdir/ExEf-V170/ExEflogo.gif $pkgdir/usr/share/ExEf/
  cp $srcdir/ExEf-V170/.ExEfrc $pkgdir/usr/share/ExEf/
  cp -R $srcdir/ExEf-V170/configs $pkgdir/usr/share/ExEf/
}
