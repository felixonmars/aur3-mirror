# Contributor: Cedric Chabanois <cchabanois@gmail.com>
pkgname=jclazz
pkgver=1.2.2
pkgrel=1
pkgdesc="Set of utilities for manipulating Java class files. Currently it includes 'Java Class Info' and 'Java Decompiler'"
arch=('i686' 'x86_64')
url="http://jclazz.sourceforge.net"
license=('GPL')
groups=()
depends=('java-runtime')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(http://downloads.sourceforge.net/jclazz/$pkgname-$pkgver-linux.tar.bz2)
noextract=()
md5sums=('ee58252bfea2948ced291455c7930098')

build() {
  cd "$startdir/src/$pkgname-$pkgver"
  mkdir -p ${pkgdir}/usr/share/jclazz
  mkdir -p ${pkgdir}/usr/bin
  cp -R * ${pkgdir}/usr/share/jclazz
  cat >${pkgdir}/usr/bin/jclazz-gui << EOC
java -jar /usr/share/jclazz/bin/jclazz-gui.jar
EOC
  cat >${pkgdir}/usr/bin/jclazz-decomp << EOC
LIB_PATH=/usr/share/jclazz/bin
java -classpath \$LIB_PATH/jclazz-core.jar:\$LIB_PATH/jclazz-decomp.jar ru.andrew.jclazz.decompiler.ClassDecompiler \$@
EOC
  cat >${pkgdir}/usr/bin/jclazz-infoj << EOC
LIB_PATH=/usr/share/jclazz/bin
java -classpath \$LIB_PATH/jclazz-core.jar ru.andrew.jclazz.core.infoj.InfoJ \$@
EOC
  chmod 0755 ${pkgdir}/usr/bin/jclazz-gui
  chmod 0755 ${pkgdir}/usr/bin/jclazz-decomp
  chmod 0755 ${pkgdir}/usr/bin/jclazz-infoj
}
