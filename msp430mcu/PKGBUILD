# Contributor: Rick W. Chen <stuffcorpse at archlinux dot us>

pkgname=msp430mcu
pkgver=20120406
pkgrel=2
pkgdesc="C headers and binutils linker scripts for microcontrollers in the MSP430 family"
arch=(any)
url="http://mspgcc4.sourceforge.net/"
license=('GPL')
makedepends=('python2')
options=(!strip)

_mspgcc_ver=${pkgver}
_gnu_mirror="http://ftpmirror.gnu.org"
_sf_base="http://sourceforge.net/projects/mspgcc/files"
_patches_base="${_sf_base}/Patches/LTS/${_mspgcc_ver}"

_patches=("${pkgname}-${pkgver}-sf3522088.patch")

source=("http://sourceforge.net/projects/mspgcc/files/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        "${_patches[0]}::${_patches_base}/${_patches[0]}/download")
sha1sums=('c096eec84f0f287c45db713a550ec50c518fa065'
          '83d408fd08a1fd0b1d8ab2a300d6124423952ac4')

_builddir="${srcdir}/build"

build() {
  cp -r "${srcdir}/msp430mcu-${pkgver}" ${_builddir} && cd ${_builddir}
  sed -i -e "s|python |python2 |" $(find ./scripts/ -name '*.sh')

  (cd "${_builddir}" &&
    for patch in ${_patches[@]} ; do
      msg "Applying ${patch}"
      patch -p1 < "${srcdir}/${patch}"
    done)

  export MSP430MCU_ROOT=$(pwd)
  ./scripts/build.sh
}

package() {
  cd ${_builddir}
  mkdir -p ${pkgdir}/usr/bin
  ./scripts/install.sh "${pkgdir}/usr"

  local PREFIX="/usr"
  local BINPATH=${PREFIX}/bin
  local INCPATH=${PREFIX}/msp430/include
  local LIBPATH=${PREFIX}/msp430/lib
  local VERSION=$(cat ${_builddir}/.version)
  local UPSTREAM_VERSION=$(cat ${_builddir}/upstream/.version)

  # override bogeyness
  cat ${srcdir}/${pkgname}-${pkgver}/bin/msp430mcu-config.in \
    | sed \
    -e 's!@PREFIX@!'"${PREFIX}"'!g' \
    -e 's!@SCRIPTPATH@!'"${LIBPATH}/ldscripts"'!g' \
    -e 's!@INCPATH@!'"${INCPATH}"'!g' \
    -e 's!@VERSION@!'"${VERSION}"'!g' \
    -e 's!@UPSTREAM_VERSION@!'"${UPSTREAM_VERSION}"'!g' \
    > ${srcdir}/msp430mcu-config

  install --backup=none -Dm755 ${srcdir}/msp430mcu-config ${pkgdir}/usr/bin/msp430mcu-config
}

# vim:set sts=2 ts=2 sw=2 et:
