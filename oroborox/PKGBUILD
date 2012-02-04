# Contributor: linfocito <dududa@gmail.com>
pkgname=oroborox
pkgver=0.9.7.9.1
pkgrel=6
pkgdesc="A lightweight Window Manager for ROX"
url="http://rox.sourceforge.net/desktop/OroboROX"
arch=('i686')
license="GPL"
depends=('pygtk' 'rox-lib' )
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://kent.dl.sourceforge.net/sourceforge/rox/OroboROX-$pkgver.tar.bz2)
md5sums=('ee70e91aa845e451b043539d3d27fde4')

build() {
  cd $startdir/src/OroboROX
  sed -i "s/ -march=i486 -mtune=i686 -m32//" AppRun
  sed -i "s/ -march=i486 -mcpu=i686 -m32//" AppRun
  sed -i "s/-Os/$CFLAGS/" AppRun
  ./AppRun --compile
  rm -rf src =build Help Configure/OroboScheme/Help
  mkdir -p $startdir/pkg/usr/share/OroboROX
  mkdir -p $startdir/pkg/usr/bin
  cp -R * .DirIcon $startdir/pkg/usr/share/OroboROX
  echo "#!/bin/sh" > $startdir/pkg/usr/bin/oroborox
  echo "exec /usr/share/OroboROX/OroboROX-$pkgver/AppRun \"\$@\"" >> $startdir/pkg/usr/bin/oroborox
  chmod +x $startdir/pkg/usr/bin/oroborox
}
