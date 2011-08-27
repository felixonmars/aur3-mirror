# Maintainer: jpate <j.k.pate@sms.ed.ac.uk>
pkgname=wordfreak
pkgver=2.2
maintainer="jpate"
pkgrel=1
pkgdesc="A java-based linguistic annotation tool designed to support human, and automatic annotation of linguistic data"
arch=('any')
url="http://wordfreak.sourceforge.net/"
license=('Mozilla Public License')
depends=( 'java-runtime' )
source=("http://kent.dl.sourceforge.net/project/wordfreak/wordfreak/${pkgver}/wordfreak-${pkgver}.jar")
noextract=('wordfreak-${pkgver}.jar')
md5sums=('a0e07e8be0ef68df5b25294af1ec24f8')

build() {
  cd $startdir/

  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/wordfreak/
  cp $srcdir/wordfreak-${pkgver}.jar $pkgdir/usr/share/wordfreak/

  echo "#!/bin/sh" > $pkgdir/usr/bin/wordfreak
  echo "java -Xmx512m -jar /usr/share/wordfreak/wordfreak-${pkgver}.jar  \"\$@\"" >> $pkgdir/usr/bin/wordfreak
  chmod a+x $pkgdir/usr/bin/wordfreak
}

