pkgname=gltf
_gitname=glTF
pkgver=0.r941.df48928
pkgrel=1
pkgdesc="Converter from COLLADA to glTF, the runtime asset format for WebGL, OpenGL ES, and OpenGL"
arch=(x86_64)
url="https://github.com/KhronosGroup/glTF"
license=('BSD')
groups=()
depends=('opencollada')
makedepends=('gcc')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git://github.com/KhronosGroup/glTF.git
git://github.com/KhronosGroup/OpenCOLLADA.git)
noextract=()
sha256sums=(SKIP
			SKIP)

pkgver() {
  cd $_gitname
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  #submodule
  cp -r ./OpenCOLLADA/* $srcdir/glTF/converter/COLLADA2GLTF/dependencies/OpenCOLLADA/
}
 
build() {
  cd glTF/converter/COLLADA2GLTF

  cmake .
  make
}
 
package() {
  cd $pkgdir
  mkdir -p ./usr/bin

  cd $srcdir/glTF/converter/COLLADA2GLTF/bin
  cp * "$pkgdir/usr/bin"
}

