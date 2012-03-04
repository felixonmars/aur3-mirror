# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jaroslaw Rosiek (jaroslaw.rosiek@interia.pl)
# Contributor: kevin <kevin@archlinux.org>
# Contributor: Luca Roccia <little_rock@users.sourceforge.net>
# Based on mingw32-boost
 
pkgname=mingw32-boost-static
pkgver=1.49.0
_boostver=${pkgver//./_}
pkgrel=1
pkgdesc="Free peer-reviewed portable C++ source libraries (mingw32)"
arch=(any)
url="http://www.boost.org/"
license=('custom')
provides=('mingw32-boost')
conflicts=('mingw32-boost')
depends=('mingw32-bzlib-static' 'mingw32-zlib-static' 'mingw32-gcc')
makedepends=('patch')
#optdepends=('python: for python bindings')
options=(!strip)
source=(http://downloads.sourceforge.net/sourceforge/boost/boost_${_boostver}.tar.gz
        user-config.jam
        boost_thread_win32.patch)
md5sums=('e0defc8c818e4f1c5bbb29d0292b76ca'
         '930ff541235abd3c62095e29395c22ca'
         '5506dcd1ab03b9dd1fc21cbfaef18969')

build() {
  # need this file for telling bjam to build for mingw32
  echo "using python : 2.7 : /usr/bin/python2 ;" >> ${srcdir}/usr-config.jam
  cp ${srcdir}/user-config.jam ${srcdir}/boost_${_boostver}/
  
  cd ${srcdir}/boost_${_boostver} 
  patch -p1 < ../boost_thread_win32.patch

  # build bjam
  cd ${srcdir}/boost_${_boostver}/tools/build/v2/engine
  ./build.sh cc

  _bindir="bin.linuxx86"
  [ "${CARCH}" = "x86_64" ] && _bindir="bin.linuxx86_64"

  install -m755 -d ${pkgdir}/usr/bin
  install -m755 ${_bindir}/bjam ${pkgdir}/usr/bin/bjam
 
  # build bcp
  cd ${srcdir}/boost_${_boostver}/tools/bcp
  ../build/v2/engine/${_bindir}/bjam --toolset=gcc
  install -m755 ${srcdir}/boost_${_boostver}/dist/bin/bcp \
                ${pkgdir}/usr/bin/bcp

  # build libs
  cd ${srcdir}/boost_${_boostver}
  # default "minimal" install: "release link=shared,static
  # runtime-link=shared threading=multi"
  # --layout=tagged will add the "-mt" suffix for multithreaded libraries
  # and installs includes in /usr/include/boost.
  # --layout=system no longer adds the -mt suffix for multi-threaded libs.

  cp ${srcdir}/user-config.jam ${srcdir}/boost_${_boostver}/
  ./tools/build/v2/engine/${_bindir}/bjam \
        --user-config=user-config.jam \
        release debug-symbols=off threading=single,multi \
        runtime-link=static link=static threadapi=win32 target-os=windows \
        cflags=-fno-strict-aliasing \
        toolset=gcc \
        --prefix=${pkgdir}/usr/i486-mingw32 \
        -sTOOLS=gcc \
        --layout=tagged \
        --without-python \
        ${MAKEFLAGS} \
          install
	   
        #--with-date_time          \
        #--with-filesystem         \
        #--with-graph              \
        #--with-graph_parallel     \
        #--with-iostreams          \
        #--with-math               \
        #--with-mpi                \
        #--with-program_options    \
        #--with-random             \
        #--with-regex              \
        #--with-serialization      \
        #--with-signals            \
        #--with-system             \
        #--with-test               \
        #--with-thread             \
        #--with-wave               \

        #--with-python             \

  find ${pkgdir}/usr/i486-mingw32 -name *.a | xargs i486-mingw32-ranlib

  # build pyste (won't work yet)
  #cd ${srcdir}/boost_${_boostver}/libs/python/pyste/install
  #python2 setup.py install --root=${pkgdir}/i486-minw32 || return 1

  # clean up stuff we don't need
  rm -rf ${pkgdir}/usr/bin
}
