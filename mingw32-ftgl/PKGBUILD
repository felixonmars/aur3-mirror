# Maintainer: Michael Ensslin <michael@ensslin.cc>
pkgname=mingw32-ftgl
pkgver=2.1.3rc5
pkgrel=1
pkgdesc="OpenGL library to use arbitrary fonts (mingw32)"
arch=('any')
url="http://sourceforge.net/projects/ftgl"
license=('LGPL2.1')
makedepends=('mingw32-gcc')
depends=('mingw32-runtime' 'mingw32-freetype')
options=('!strip' '!buildflags')
source=(ftgl.tar.gz::"http://sourceforge.net/projects/ftgl/files/latest/download?source=files"
	configure.patch
	m4.gl.m4.patch)
md5sums=('fcf4d0567b7de9875d4e99a9f7423633'
	'07ab51b38eb41b1097e7b6c9304e9023'
	'8590beb2dea7e28e7b7214ed562b2472')

build() {
  #there is a bug in ftgl's configure script so it will look for the GL/GLU libraries
  #instead of the opengl32/glu32 libraries when building for mingw32.
  #this first patch is taken from
  #  http://wiki.armagetronad.org/index.php/Cross-compiling_Windows_version_from_Linux
  #it should be 100% identical to the version provided there.
  patch "${srcdir}/ftgl-2.1.3~rc5/m4/gl.m4" m4.gl.m4.patch

  #even after applying the first patch, ./configure aborted with an error message
  #  error: GL library could not be found, please specify its location with --with-gl-lib.
  #so i wrote this ugly, ugly second patch that directly patches the configure file to ignore
  #that error.
  patch "${srcdir}/ftgl-2.1.3~rc5/configure" configure.patch

  cd "${srcdir}/ftgl-2.1.3~rc5"

  ./configure --without-x --host=i486-mingw32 --prefix=/usr/i486-mingw32/
  make
}

package() {
  cd "${srcdir}/ftgl-2.1.3~rc5"

  make "prefix=${pkgdir}/usr/i486-mingw32" install
}
