# Contributor: Daniel Kirchner <daniel@ekpyron.org>
pkgname=wildmagic
pkgver=5.9
pkgrel=1
pkgdesc="3D real-time graphics engine."
url="http://www.geometrictools.com/"
license="custom"
depends=()
makedepends=('libgl' 'gcc')
provides=()
conflicts=()
replaces=()
backup=()
arch=(i686 x86_64)
install=
source=(http://www.geometrictools.com/Downloads/WildMagic5p9.zip)
sha512sums=('ea5d4bd402505fc061fe8e3fba40e0b8c46fbb38bdde60aa27f90483d84bd493389b9dc3622278391d46ffd56d9c7917323d27217a8a22b862d8fa9c936ec9f2')

build() {
  cd $startdir/src/GeometricTools/WildMagic5

  make CFG=Release SYS=Linux GRF=Glx -f makefile.wm5 || return 1

  mkdir -p $startdir/pkg/opt/WildMagic5/Library
  cp $startdir/src/GeometricTools/WildMagic5/SDK/Library/Release/lib* $startdir/pkg/opt/WildMagic5/Library/
  mkdir -p $startdir/pkg/opt/WildMagic5/Include
  cp $startdir/src/GeometricTools/WildMagic5/SDK/Include/* $startdir/pkg/opt/WildMagic5/Include/
}
