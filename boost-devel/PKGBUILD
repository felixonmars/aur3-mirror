# Maintainer: Peter Simons <simons@cryp.to>
_pkgname=boost
pkgname=${_pkgname}-devel
pkgver=1.46.0
_boostver=${pkgver//./_}
pkgrel=2
pkgdesc="Boost provides free peer-reviewed portable C++ source libraries."
arch=('i686' 'x86_64')
url="http://www.boost.org/"
depends=('bzip2' 'zlib' 'expat' 'gcc-libs')
optdepends=( 'python2: to enable building of Boost.Python2'
             'python: to enable building of Boost.Python3' )
source=("http://downloads.sourceforge.net/sourceforge/${_pkgname}/${_pkgname}_${_boostver}.tar.bz2")
license=('custom')
provides=('boost=1.46.0')
md5sums=('37b12f1702319b73876b0097982087e0')

build()
{
  # All source paths below are relative from here.
  cd "${srcdir}/${_pkgname}_${_boostver}"

  # Determine architecture-relevant settings for bjam.
  local _os="linux"
  local _arch _jam_arch _address_model _instruction_set
  case "${CARCH}" in
    i686)
      _arch="x86"
      _address_model="32"
      _instruction_set="i686"
      _jam_arch="x86"
      ;;
    x86_64)
      _arch="x86"
      _address_model="64"
      _instruction_set="nocona"
      _jam_arch="x86_64"
      ;;
    *)
      echo "*** unknown architecture $CARCH"
      exit 1
      ;;
  esac

  # Determine version of installed Python.
  local _python2_version _python3_version
  _python2_version=$(python2 --version 2>&1 | sed -r 's/Python ([0-9]+)\.([0-9]+).*/\1.\2/')
  _python3_version=$(python3 --version 2>&1 | sed -r 's/Python ([0-9]+)\.([0-9]+).*/\1.\2/')
  echo >user-config.jam "# auto-generated user-config.jam file"
  case "${_python2_version}" in
    2.[0-9]*)	echo >>user-config.jam "using python : ${_python2_version} ;" ;;
    *)		;;
  esac
  case "${_python3_version}" in
    3.[0-9]*)	echo >>user-config.jam "using python : ${_python3_version} ;" ;;
    *)		;;
  esac

  # Ensure that bjam has been built.
  local _bjam_root="tools/build/v2/engine/src"
  local _bjam="${_bjam_root}/bin.${_os}${_jam_arch}/bjam"
  [ -x "${_bjam}" ] || ( cd "${_bjam_root}" && ./build.sh )

  # If MAKEFLAGS enables a parallel build, use it. Unfortunately, we
  # cannot pass all make flags, so some imperfect guessing is necessary.
  local _bjam_j_flag=""
  case "${MAKEFLAGS}" in
    -j[0-9]|-j[0-9][0-9]|-j[0-9][0-9][0-9]) _bjam_j_flag="${MAKEFLAGS}";;
    *) ;;
  esac

  # Build and install Boost.
  echo ""
  echo "The build is about to start. Please note that the initial dependency"
  echo "scanning phase may take a long time, even on fast machines. Please"
  echo "be patient."
  echo ""
  "${_bjam}" ${_bjam_j_flag} -d2 \
    "architecture=${_arch}" \
    "address-model=${_address_model}" \
    "instruction-set=${_instruction_set}" \
    ${CXXFLAGS:+"cxxflags=${CXXFLAGS}"} \
    toolset=gcc \
    --build-type=complete \
    --layout=versioned \
    "--prefix=${pkgdir}/usr" \
    --user-config=user-config.jam \
    -sEXPAT_INCLUDE=/usr \
    -sEXPAT_LIBPATH=/usr \
    install || return 1

  # Copy license.
  install -Dm645 \
    "LICENSE_1_0.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_1_0.txt" \
    || return 1

  # We don't build and install pyste: the code doesn't work with Python
  # 2.6, because it doesn't manage to import the elementtree library
  # correctly.
  #
  # cd libs/python/pyste/install || return 1
  # python setup.py install --root="${pkgdir}" || return 1

  # Use a symlink to install the version-specific set of includes from
  # Boost 1.46.0 in the system for inclusion as <boost/header.hpp>.
  cd "${pkgdir}/usr/include" || return 1
  ln -sf boost-1_46/boost/ boost || return 1
}
