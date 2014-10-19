
pkgname=glus
pkgver=2.0
pkgrel=1
pkgdesc="Modern OpenGL, OpenGL ES and OpenVG Utilities"
arch=('i686' 'x86_64')
url=("https://www.opengl.org/sdk/libs/GLUS/")
license=('LGPL')
# depends=('glfw' 'glew')
makedepends=('cmake')
source=("https://github.com/McNopper/GLUS/archive/v${pkgver}.tar.gz")
md5sums=('f33aa2e5e6be836b89fa8c0a6418ba59')

build()
{
  cd "$srcdir/GLUS-${pkgver}/GLUS"
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON ..
  make
}

package()
{
  cd "$srcdir/GLUS-${pkgver}/GLUS/build"
  # installation is fixed by https://github.com/McNopper/GLUS/pull/1
  install -Dm644 libGLUS.so "$pkgdir"/usr/lib/libGLUS.so
  install -d "$pkgdir"/usr/include/{GLES2,GLES3,VG,GL,GLUS}
  install -m644 ../src/GLES2/*.h "$pkgdir"/usr/include/GLES2
  install -m644 ../src/GLES3/*.h "$pkgdir"/usr/include/GLES3
  install -m644 ../src/GLUS/*.h "$pkgdir"/usr/include/GLUS
  install -m644 ../src/GL/*.h "$pkgdir"/usr/include/GL
  install -m644 ../src/VG/*.h "$pkgdir"/usr/include/VG
}
