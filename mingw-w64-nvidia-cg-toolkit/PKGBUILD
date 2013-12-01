pkgname=mingw-w64-nvidia-cg-toolkit
pkgver=3.1
pkgrel=2
pkgdesc="NVIDIA Cg libraries (mingw-w64)"
arch=(any)
url="http://developer.nvidia.com/object/cg_toolkit.html"
license=("custom")
makedepends=(innoextract dos2unix mingw-w64-tools mingw-w64-binutils)
depends=(mingw-w64-crt)
options=(!strip !buildflags staticlibs)
source=("http://developer.download.nvidia.com/cg/Cg_3.1/Cg-3.1_April2012_Setup.exe")
noextract=("Cg-3.1_April2012_Setup.exe")
md5sums=('7831c85af8b41e132d7c563427a7802f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir"
  innoextract "Cg-3.1_April2012_Setup.exe"
  find . -type f -exec dos2unix {} \;
  find . -name '*glut32*' | xargs -rtl1 rm
  rm "app/include/GL/glut.h"
}

build() {
	cd "$srcdir/app/bin"
	for file in `ls *.dll`; do
		gendef $file
		i686-w64-mingw32-dlltool -d ${file%dll}def -l lib${file%dll}a -D $file
	done
	cd "../bin.x64"
	for file in `ls *.dll`; do
		gendef $file
		x86_64-w64-mingw32-dlltool -d ${file%dll}def -l lib${file%dll}a -D $file
	done
}

package() {
  cd "$srcdir/app"
  for _arch in ${_architectures}; do
    find "include/" -name '*.h' | xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/${_arch}/"{} 
  done
  cd bin
  find . -name '*.dll' | xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/i686-w64-mingw32/bin/"{}
  find . -name '*.a' | xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/i686-w64-mingw32/lib/"{}
  cd ../bin.x64
  find . -name '*.dll' | xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/x86_64-w64-mingw32/bin/"{}
  find . -name '*.a' | xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/x86_64-w64-mingw32/lib/"{}
}
