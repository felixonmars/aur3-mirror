# Maintainer: Dmitriy Morozov <archlinux@foxcub.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Kritoke <kritoke@gamebox.net>
# Contributor: Luca Roccia <little_rock@users.sourceforge.net>

# This PKGBUILD is modified from Arch's official Boost PKGBUILD to build the
# Boost.Logging library

pkgname=boost-log-svn
pkgver=856
_boostbase=boost
_boostver=1_53_0
pkgrel=1
arch=('i686' 'x86_64')
url="http://boost-log.sf.net"
license=('custom')
makedepends=('icu>=51.1' 'python' 'python2' 'bzip2' 'zlib' 'openmpi')
conflicts=('boost-log')
source=(http://downloads.sourceforge.net/sourceforge/${_boostbase}/${_boostbase}_${_boostver}.tar.gz
        boost-1.53.0-python3.patch)

_svntrunk=https://boost-log.svn.sourceforge.net/svnroot/boost-log/trunk
_svnmod=boost-log

build() {
   _stagedir="${srcdir}/stagedir"

   local JOBS="$(sed -e 's/.*\(-j *[0-9]\+\).*/\1/' <<< ${MAKEFLAGS})"

  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  cp -a ${srcdir}/$_svnmod/$_svnmod/boost ${srcdir}/${_boostbase}_${_boostver}
  cp -a ${srcdir}/$_svnmod/$_svnmod/libs  ${srcdir}/${_boostbase}_${_boostver}

   cd "${srcdir}/${_boostbase}_${_boostver}"

   # Fix build errors with python 3
   sed -i "/PYTHON_ROOT/s/print sys.prefix/print(sys.prefix)/g" bootstrap.sh
   patch -Np1 -i ../boost-1.53.0-python3.patch

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
   install "${srcdir}"/${_boostbase}_${_boostver}/tools/build/v2/engine/${_bindir}/bjam "${_stagedir}"/bin/bjam

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
      --with-log \
      --prefix="${_stagedir}" \
      ${JOBS} \
      install
}

package_boost() {
   pkgdesc="Free peer-reviewed portable C++ source libraries - Development"
   depends=("boost-libs=${pkgver}")
   optdepends=('python: for python bindings'
               'python2: for python2 bindings'
               'boost-build: to use boost jam for building your project.')

   _stagedir="${srcdir}/stagedir"

   install -d -m 755 "${pkgdir}"/usr
   cp -a "${_stagedir}"/{bin,include,share} "${pkgdir}"/usr

   install -D -m 644 "${srcdir}/"${_boostbase}_${_boostver}/LICENSE_1_0.txt \
      "${pkgdir}"/usr/share/licenses/boost/LICENSE_1_0.txt
}

package_boost-libs() {
   pkgdesc="Free peer-reviewed portable C++ source libraries - Runtime"
   depends=('bzip2' 'zlib' 'icu')
   optdepends=('openmpi: for mpi support')

   _stagedir="${srcdir}/stagedir"

   install -d -m 755 "${pkgdir}"/usr
   cp -a "${_stagedir}"/lib "${pkgdir}"/usr

   install -D -m 644 "${srcdir}/"${_boostbase}_${_boostver}/LICENSE_1_0.txt \
      "${pkgdir}"/usr/share/licenses/boost-libs/LICENSE_1_0.txt
}

package_boost-log-svn() {
    pkgdesc="Logging library provisionally accepted to Boost"
    depends=('boost')

    _stagedir="${srcdir}/stagedir"

    install -dm 755 "${pkgdir}"/usr/include/boost
    install -dm 755 "${pkgdir}"/usr/lib
    # headers/source files
    cp -r "${_stagedir}"/include/boost/log "${pkgdir}"/usr/include/boost

    # static libs
    cp -r "${_stagedir}"/lib/*log*.so{,.*} "${pkgdir}/usr/lib/"
}
md5sums=('57a9e2047c0f511c4dfcf00eb5eb2fbb'
         'dc7ccb81b1bde9c90d29d2819ec387f7')
