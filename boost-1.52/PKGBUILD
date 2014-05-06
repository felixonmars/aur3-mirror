# $Id: PKGBUILD 193196 2013-08-18 16:43:01Z svenstaro $
# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Kritoke <kritoke@gamebox.net>
# Contributor: Luca Roccia <little_rock@users.sourceforge.net>

pkgbase='boost-1.52'
pkgname='boost-1.52'
true && pkgname=('boost-libs-1.52' 'boost-1.52')
pkgver=1.52.0
_boostver=${pkgver//./_}
pkgrel=3
url="http://www.boost.org/"
arch=('i686' 'x86_64')
license=('custom')
makedepends=('icu>=51.1' 'python' 'python2' 'bzip2' 'zlib' 'openmpi')
source=(http://downloads.sourceforge.net/boost/boost_${_boostver}.tar.gz
        fix-new-glibc.patch)
sha1sums=('069501636097d3f40ddfd996d29748bb23591c53'
          'e3a5fac340c12b39add50070efb439b857108a0b')

build() {
    export _stagedir="${srcdir}/stagedir"
   local JOBS="$(sed -e 's/.*\(-j *[0-9]\+\).*/\1/' <<< ${MAKEFLAGS})"

   cd "${srcdir}/boost_${_boostver}"

   patch -Np2 -i ../fix-new-glibc.patch

   # Fix build errors with python 3
   sed -i "/PYTHON_ROOT/s/print sys.prefix/print(sys.prefix)/g" bootstrap.sh

   # Shut up strict aliasing warnings
   echo "using gcc : : : <compileflags>-fno-strict-aliasing ;" >> ./tools/build/v2/user-config.jam
   # Add an extra python version. This does not replace anything and python 2.x need to be the default.
   echo "using python : 3.3 : /usr/bin/python3 : /usr/include/python3.3m : /usr/lib ;" >> ./tools/build/v2/user-config.jam
   # Support for OpenMPI
   echo "using mpi ;" >> ./tools/build/v2/user-config.jam

   ./bootstrap.sh --with-toolset=gcc --with-icu --with-python=/usr/bin/python2

   _bindir="bin.linuxx86"
   [ "${CARCH}" = "x86_64" ] && _bindir="bin.linuxx86_64"

   install -d -m 755 "${_stagedir}"/bin
   install "${srcdir}"/boost_${_boostver}/tools/build/v2/engine/${_bindir}/bjam "${_stagedir}"/bin/bjam

   pushd tools
   for _tool in bcp inspect quickbook compiler_status process_jam_log wave; do
      "${_stagedir}"/bin/bjam --toolset=gcc $_tool
   done
   "${_stagedir}"/bin/bjam --toolset=gcc cflags="-std=gnu++11" library_status
   popd
   cp -a dist/bin/* "${_stagedir}"/bin

   #boostbook is needed by quickbook
   install -d -m 755 "${_stagedir}"/share/boostbook
   cp -a tools/boostbook/{xsl,dtd} "${_stagedir}"/share/boostbook/

   # default "minimal" install: "release link=shared,static
   # runtime-link=shared threading=single,multi"
   # --layout=tagged will add the "-mt" suffix for multithreaded libraries
   # and installs includes in /usr/include/boost.
   # --layout=system no longer adds the -mt suffix for multi-threaded libs.
   # install to ${_stagedir} in preparation for split packaging
   "${_stagedir}"/bin/bjam \
      variant=release \
      debug-symbols=off \
      threading=multi \
      runtime-link=shared \
      link=shared \
      toolset=gcc \
      python=2.7 \
      --layout=system \
      --prefix="${_stagedir}" \
      ${JOBS} \
      install

   find ${_stagedir} -name \*.a -exec rm -f {} \;
}

package_boost-1.52() {
   export _stagedir="${srcdir}/stagedir"
   pkgdesc="Free peer-reviewed portable C++ source libraries - Development"
   depends=("boost-libs-1.52=${pkgver}")
   optdepends=('python: for python bindings'
               'python2: for python2 bindings'
               'boost-build: to use boost jam for building your project.')

   install -d -m 755 "${pkgdir}"/opt/boost-1.52
   cp -a "${_stagedir}"/{bin,include,share} "${pkgdir}"/opt/boost-1.52

   install -D -m 644 "${srcdir}/"boost_${_boostver}/LICENSE_1_0.txt \
      "${pkgdir}"/opt/boost-1.52/share/licenses/boost/LICENSE_1_0.txt
}

package_boost-libs-1.52() {
   export _stagedir="${srcdir}/stagedir"
   pkgdesc="Free peer-reviewed portable C++ source libraries - Runtime"
   depends=('bzip2' 'zlib' 'icu')
   optdepends=('openmpi: for mpi support')

   install -d -m 755 "${pkgdir}"/opt/boost-1.52
   cp -a "${_stagedir}"/lib "${pkgdir}"/opt/boost-1.52

   install -D -m 644 "${srcdir}/"boost_${_boostver}/LICENSE_1_0.txt \
      "${pkgdir}"/opt/boost-1.52/share/licenses/boost-libs/LICENSE_1_0.txt
}
sha1sums=('1120430030315b0a94b6d63fc04662960db2444c'
          'e3a5fac340c12b39add50070efb439b857108a0b')
