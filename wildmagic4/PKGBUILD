# Contributor: Brice Méalier <mealier_brice@yahoo.fr>
pkgname=wildmagic4
pkgver=4.8
pkgrel=1
pkgdesc="3D real-time graphics engine."
url="http://www.geometrictools.com/"
license="Wild Magic License Agreement (LGPL)"
depends=()
makedepends=('xorg' 'gcc')
provides=()
conflicts=()
replaces=()
backup=()
arch=(i686)
install=
source=(http://www.geometrictools.com/Downloads/WildMagic4p8.zip)
md5sums=('591818e1fac323511229742c2b9cb5a9')

build() {
  cd $startdir/src/GeometricTools
#  patch -p1 < ../wildmagic.patch

  cd $startdir/src/GeometricTools/WildMagic4

  find ./ -name "*.wm4" | xargs sed -e 's|INCPATH := |INCPATH += |;s|LIBPATH := |LIBPATH += |;s|CC|CXX|;s|CFLAGS :=|CFLAGS += -fPIC -shared|;s|/usr/X11R6/include|/usr/include|' -i


  sed -e 's|GetEnv("WM4_PATH")|"Data"|' -i LibFoundation/System/Wm4System.cpp

  make CFG=Release SYS=linux GRF=OpenGL -f makefile.wm4 || return 1

  mkdir -p $startdir/pkg/opt/WildMagic4/Library
  cp $startdir/src/GeometricTools/WildMagic4/SDK/Library/Release/lib* $startdir/pkg/opt/WildMagic4/Library/
  mkdir -p $startdir/pkg/opt/WildMagic4/Include
  cp $startdir/src/GeometricTools/WildMagic4/SDK/Include/* $startdir/pkg/opt/WildMagic4/Include/

}
