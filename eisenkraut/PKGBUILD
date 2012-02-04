# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname=eisenkraut
pkgver=0.74
pkgrel=2
pkgdesc="a standalone, cross-platform audio file editor using the SuperCollider 3 server application."
arch=('any')
url="http://www.sciss.de/eisenkraut/"
license=('GPL')
depends=('java-runtime')
makedepends=('apache-ant')
source=(http://sourceforge.net/projects/eisenkraut/files/eisenkraut/${pkgver}/Eisenkraut-src-${pkgver}.zip)
md5sums=('19f6af865bfc302f12a4c47f2968281d')

build() {
  cd $srcdir/Eisenkraut
  ant dist
  cd dist
  tar -xvzopf Eisenkraut-linux-${pkgver}.tar.gz
}

package() {
  install -d "$pkgdir/usr/bin/"
  cat << EOF >> "$pkgdir/usr/bin/eisenkraut"
#!/bin/sh
"$JAVA_HOME/bin/java" -jar '/usr/share/java/Eisenkraut/Eisenkraut.jar'
EOF

  chmod 755 "$pkgdir/usr/bin/eisenkraut"
  install -d ${pkgdir}/usr/share/java/eisenkraut
  cp -rf $srcdir/Eisenkraut/dist/Eisenkraut ${pkgdir}/usr/share/java
}