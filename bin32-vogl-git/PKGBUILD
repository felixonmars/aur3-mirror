# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=bin32-vogl-git
pkgver=105.2575dc2
pkgrel=1
pkgdesc="An OpenGL debugger"
arch=('x86_64')
url="https://github.com/ValveSoftware/vogl"
license=('MIT')
# 'glu' 'freeglut' 'libxxf86vm' 'sdl2' are dependencies of glxspheres64 demo
# that is disabled in this package
depends=('lib32-qt4' 'lib32-libjpeg-turbo' 'lib32-tinyxml')
# texlive-core is pretty useless here, but libunwind requires it to generate doc
makedepends=('git' 'cmake' 'gcc-multilib' 'texlive-core')
options=('!buildflags' '!makeflags')
source=('git+https://github.com/ValveSoftware/vogl.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/vogl"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir/vogl"
  # disable building of glxspheres64 demo to keep the dependencies minimal
  sed -i 's|^add_subdirectory(glxspheres)|#&|' src/CMakeLists.txt
  # use 32bit lib unwind
  sed -i 's|libunwind.h|libunwind-x86.h|' src/libbacktrace/CMakeLists.txt src/libbacktrace/btrace.cpp
  sed -i 's|libunwind |libunwind-x86.a |' src/libbacktrace/CMakeLists.txt
  # disable some optimizations for vogl_entrypoints.cpp to avoid memory exhaustion
  sed -i 's|-fno-var-tracking|"-fno-var-tracking -fvisibility=default"|' src/voglcommon/CMakeLists.txt
}

build() {
  mkdir -p "$srcdir/build"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export LDFLAGS="-m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  # build static libunwind
  cd "$srcdir/vogl/external/libunwind"
  CFLAGS="-fPIC" ./configure --prefix="$srcdir/build/external" --target=i686 --enable-debug-frame \
                             --enable-shared=no --enable-static=yes --disable-minidebuginfo
  make
  make install

  cd "$srcdir/build"
  cmake ../vogl/src \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=True \
    -DCMAKE_PREFIX_PATH="$srcdir/build/external;/usr/lib32" \
    -DBUILD_GL_TESTS=False \
    -DBUILD_GL_SAMPLES=False \
    -DBUILD_X64=Off
  make
}

package() {
  cd "$srcdir/vogl"

  install -d -m755 "$pkgdir"/usr/{bin,lib32}

  install -m644 vogl_build/bin/*.so "$pkgdir"/usr/lib32
  install -m755 vogl_build/bin/vogl* "$pkgdir"/usr/bin

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
