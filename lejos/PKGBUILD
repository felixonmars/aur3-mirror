pkgname=lejos
pkgver=2.1.0
pkgrel=1
pkgdesc="A java SDK for Lego Mindstorms"
url="http://lejos.sourceforge.net"
license="MPL"
depends=(jdk)
makedepends=(jdk)
provides=()
conflicts=()
replaces=()
backup=()
install=lejos.install
source=(http://dl.sourceforge.net/sourceforge/lejos/lejos_2_1_0.tar.gz)
md5sums=(be3c0b92b94c01080aa1e05d4f10fd10)

build() {
  mkdir -p $startdir/pkg/opt/
  cd $startdir
  patch -p0 < lejos.patch
  cd $startdir/src/lejos_2_1_0
  make JAVAC="javac -target 1.1 -source 1.3 -classpath classes:./jtools"

  chmod +x $startdir/src/lejos_2_1_0/bin/*

  # Remove the windows stuff
  rm $startdir/src/lejos_2_1_0/bin/*.bat
  rm $startdir/src/lejos_2_1_0/bin/LEGAL

  mkdir -p $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/lib
  mkdir -p $startdir/pkg/usr/share/lejos
  mkdir -p $startdir/pkg/usr/share/lejos/bin

  mv $startdir/src/lejos_2_1_0/bin/libirtower.so $startdir/pkg/usr/lib
  cp -p  $startdir/src/lejos_2_1_0/bin/* $startdir/pkg/usr/bin
  cp -pr $startdir/src/lejos_2_1_0/classes $startdir/pkg/usr/share/lejos
  cp -pr $startdir/src/lejos_2_1_0/jtools $startdir/pkg/usr/share/lejos
  cp -pr $startdir/src/lejos_2_1_0/lib $startdir/pkg/usr/share/lejos/
  #cp -rp $startdir/src/lejos_2_1_0 $startdir/pkg/opt/lejos

  # lejosdl will whine if it can't find libirtower.so in
  # $LEJOS_HOME/bin. We fix this using a symlink
  ln -s ../../../lib/libirtower.so $startdir/pkg/usr/share/lejos/bin
}
