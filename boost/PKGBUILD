# Maintainer: AJ Ashton <aj.ashton@gmail.com>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Kritoke <kritoke@gamebox.net>
# Contributor: Luca Roccia <little_rock@users.sourceforge.net>

pkgname=boost-icu
pkgbase=boost
pkgver=1.47.0
_boostver=${pkgver//./_}
pkgrel=1
pkgdesc="Free peer-reviewed portable C++ source libraries, built against ICU"
arch=('i686' 'x86_64')
url="http://www.boost.org/"
source=(http://downloads.sourceforge.net/sourceforge/boost/boost_${_boostver}.tar.gz)
depends=('gcc-libs' 'bzip2' 'zlib' 'icu>=4.2')
makedepends=('python2')
optdepends=('python2: for python bindings')
conflicts=('boost' 'boost-libs')
provides=('boost' 'boost-libs')
license=('custom')
options=('!ccache')
md5sums=('ff180a5276bec773a7625cac7e2288e8')

_stagedir="${srcdir}/stagedir"

build() {
  # set python path for bjam
  cd "${srcdir}/${pkgbase}_${_boostver}/tools"
  echo "using python : 2.7 : /usr/bin/python2 ;" >> build/v2/user-config.jam
  echo "using python : 3.2 : /usr/bin/python : /usr/include/python3.2mu : /usr/lib ;" >> build/v2/user-config.jam
  echo "using mpi ;" >> build/v2/user-config.jam

  # build bjam
  cd "${srcdir}/${pkgbase}_${_boostver}/tools/build/v2/engine"
  ./build.sh cc

  _bindir="bin.linuxx86"
  [ "${CARCH}" = "x86_64" ] && _bindir="bin.linuxx86_64"

  install -d "${_stagedir}"/usr/bin
  install ${_bindir}/bjam "${_stagedir}"/usr/bin/bjam

  # build tools
  cd "${srcdir}/${pkgbase}_${_boostver}/tools/"
  "${_stagedir}"/usr/bin/bjam --toolset=gcc

  # copy the tools
  cd "${srcdir}/${pkgbase}_${_boostver}/dist/bin"
  for i in *;do
      install -m755 "${i}" "${_stagedir}/usr/bin/${i}"
  done

  #boostbook needed by quickbook
  cd "${srcdir}/${pkgbase}_${_boostver}/dist/"
  cp -r share "${_stagedir}"

  # build libs
  cd "${srcdir}/${pkgbase}_${_boostver}"

  # default "minimal" install: "release link=shared,static
  # runtime-link=shared threading=single,multi"
  # --layout=tagged will add the "-mt" suffix for multithreaded libraries
  # and installs includes in /usr/include/boost.
  # --layout=system no longer adds the -mt suffix for multi-threaded libs.
  # install to ${_stagedir} in preparation for split packaging

  "${_stagedir}"/usr/bin/bjam \
      release debug-symbols=off threading=multi \
      runtime-link=shared link=shared,static \
      cflags=-fno-strict-aliasing \
      toolset=gcc \
      --prefix="${_stagedir}" \
      -sHAVE_ICU=1 \
      -sICU_PATH=/usr \
      -sTOOLS=gcc \
      --layout=system \
      ${MAKEFLAGS} \
      install
}

package() {
    install -d "${pkgdir}"/usr/{include,lib,share}
    # headers/source files
    cp -r "${_stagedir}"/include/ "${pkgdir}"/usr/

    # static libs
    cp -r "${_stagedir}"/lib/*.a "${pkgdir}"/usr/lib/

    # utilities (bjam, bcp, pyste)
    cp -r "${_stagedir}"/usr/* "${pkgdir}"/usr/

    #boostbook
    cp -r "${_stagedir}"/share/* "${pkgdir}"/usr/share

    #shared libs
    cp -r "${_stagedir}"/lib/*.so{,.*} "${pkgdir}/usr/lib/"

    # license
    install -D -m644 "${srcdir}/boost_${_boostver}/LICENSE_1_0.txt" \
        "${pkgdir}"/usr/share/licenses/boost/LICENSE_1_0.txt
}
