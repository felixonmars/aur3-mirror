# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname=meapsoft
pkgver=2.0.beta
pkgrel=1
pkgdesc="a program for segmenting and rearranging music audio recordings."
arch=('any')
url="http://www.meapsoft.org/"
license=('GPL')
depends=('java-runtime')
source=(http://www.meapsoft.org/MEAPsoft-${pkgver}.tgz)
md5sums=('86159c15092e631ae79833a591566b50')

build() {

   install -d "$pkgdir/usr/bin/"
   cat << EOF >> "$pkgdir/usr/bin/meapsoft"
#!/bin/sh
   "$JAVA_HOME/bin/java" -jar /usr/share/java/meapsoft/MEAPsoft.jar
EOF

  chmod 755 "$pkgdir/usr/bin/meapsoft"

  install -d ${pkgdir}/usr/share/java/
  rm $srcdir/MEAPsoft-${pkgver}/bin/.DS_Store
  cp -rf $srcdir/MEAPsoft-${pkgver}/bin ${pkgdir}/usr/share/java/meapsoft
}