# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=mingw32-ogre
pkgver=1.7.1
pkgrel=1
pkgdesc="A scene-oriented, flexible 3D engine written in C++ (mingw32)"
arch=('i686' 'x86_64')
url='http://www.ogre3d.org'
license=('MIT')
depends=('mingw32-boost=1.41.0' 'mingw32-gcc')
makedepends=('cmake' 'unzip')
optdepends=('cppunit: unit testing'
            'doxygen: generate API docs'
            'dot2tex: generate API docs'
            'intel-tbb: better threading support'
            'poco: portability')
source=("cmake-toolchain.cmake" 
        "http://downloads.sourceforge.net/project/ogre/ogre-dependencies-mingw/1.7/OgreDependencies_MinGW_20100216.zip" 
        "http://downloads.sourceforge.net/ogre/ogre_src_v${pkgver//./-}.tar.bz2")
md5sums=('9fcb99c1e2504f504b4780c3f503bc3f'
         '533f7f78edb78441208ca41606de90a9'
         '85083083dc65d49572654ea8c8b5c552')
options=('!strip')

build() {
  cd ${srcdir}/ogre_src_v${pkgver//./-}

  [[ -d build ]] && rm -rf build
	mkdir build
	cd build

  cp ${srcdir}/cmake-toolchain.cmake .
  cp -r ${srcdir}/Dependencies ..

  unset LDFLAGS CFLAGS CXXFLAGS
  cmake .. \
   -DCMAKE_INSTALL_PREFIX=/usr/i486-mingw32 \
   -DCMAKE_TOOLCHAIN_FILE=../cmake-toolchain.cmake \
   -DOGRE_BUILD_RENDERSYSTEM_D3D9=FALSE \
   -DOGRE_INSTALL_PLUGINS_HEADERS=TRUE \
   -DOGRE_INSTALL_SAMPLES=FALSE \
   -DOGRE_INSTALL_DOCS=FALSE \
   -DOGRE_INSTALL_MEDIA=TRUE \
   -DOGRE_INSTALL_SAMPLES_SOURCE=FALSE \
   #-DOGRE_STATIC=TRUE

  make || return 1 # OGRE has a lot of source files. 
  # Make sure your makepkg.conf has the appropiate "-jN" option for your CPU 
  # type (-j3 for dualcore, -j5 for quadcore).
  make DESTDIR=${pkgdir} install || return 1

  # clean up
  rm -r ${pkgdir}/usr/i486-mingw32/bin/
  rm -r ${pkgdir}/usr/i486-mingw32/CMake/
  rm -r ${pkgdir}/usr/i486-mingw32/lib/*
  rm -r ${pkgdir}/usr/i486-mingw32/media/

  # install properly
  mkdir -p ${pkgdir}/usr/i486-mingw32/opt/OGRE/bin
  mkdir -p ${pkgdir}/usr/i486-mingw32/opt/OGRE/media
  cp -r ${srcdir}/ogre-build/build/bin/*.dll ${pkgdir}/usr/i486-mingw32/opt/OGRE/bin/
  cp -r ${srcdir}/ogre-build/build/bin/release/*.cfg ${pkgdir}/usr/i486-mingw32/opt/OGRE/bin/
  cp -r ${srcdir}/ogre-build/build/lib/*.a ${pkgdir}/usr/i486-mingw32/lib/
}
# vim: ts=2 sw=2 expandtab
