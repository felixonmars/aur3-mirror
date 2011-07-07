# Maintainer: Vojtech Kral <kral.vojtech at gmail>
# Contributor: pfdm
# Contributor: Vi0L0
# Contributor: caust1c

# TODO: opnecl/icd/arch compliance

pkgname=amdstream
pkgver=2.4
pkgrel=3

pkgdesc='AMD Accelerated Parallel Processing (APP) SDK, formerly known as ATI Stream, now wtih OpenCL support'
arch=('i686' 'x86_64')
url="http://developer.amd.com/gpu/ATIStreamSDK/Pages/default.aspx"
license=("custom")
install=install

provides=('opencl' 'libcl')
depends=('opencl-headers' 'libgl' 'llvm' 'gcc-libs' 'mesa' 'glut' 'glew')
  #'libatical>=11.3'
optdepends=('catalyst: for OpenCL on AMD GPU')
makedepends=('perl' 'llvm')
conflicts=('nvidia-opencl' )

#Architecture resolution
_arch='x86'
_other_arch='x86_64'
_bits='32'
[ "$CARCH" = 'x86_64' ] && _arch='x86_64'
[ "$CARCH" = 'x86_64' ] && _other_arch='x86'
[ "$CARCH" = 'x86_64' ] && _bits='64'

#Sources
source=("http://download2-developer.amd.com/amd/APPSDK/AMD-APP-SDK-v${pkgver}-lnx${_bits}.tgz")

#sha256sums
sha256sums=('de59238c792a420703449786e19fd8abeafee40a185aa934364196422747958c')
[ "$CARCH" = 'x86_64' ] && sha256sums=('2aa32269d206dd4e48580cc0e5aee03f4d9d9c539b10e8f29d0a21461a58a34a')

#Install path
_ipath='/opt/amdstream'

build()
{
  cd "${srcdir}/AMD-APP-SDK-v$pkgver-lnx${_bits}"
  make -j1    #With -j other than one, build failes on ceratin configurations
}

package()
{
  cd "${srcdir}/AMD-APP-SDK-v$pkgver-lnx${_bits}"

  #Install SDK
  mkdir -p "${pkgdir}/${_ipath}"
  cp -r {glut_notice.txt,docs,include,samples} "${pkgdir}/${_ipath}/"
  mkdir -p "${pkgdir}/${_ipath}"/{bin/${_arch},lib,samples}
  cp -r "./bin/${_arch}/clinfo" "${pkgdir}/${_ipath}/bin/${_arch}/clinfo"
  cp -r "./lib/${_arch}" "${pkgdir}/${_ipath}/lib/"
  rm -rf "${pkgdir}/${_ipath}/samples/opencl/bin/${_other_arch}"
  rm -rf "${pkgdir}/${_ipath}/samples/cal/bin/${_other_arch}"

  #Register ICD
  mkdir -p "${pkgdir}/etc/OpenCL/vendors"
  echo "${_ipath}/lib/${_arch}/libamdocl${_bits}.so" > "${pkgdir}/etc/OpenCL/vendors/amd.icd"
  # The OpenCL ICD specifications: http://www.khronos.org/registry/cl/extensions/khr/cl_khr_icd.txt

  #Insall includes
  mkdir -p "${pkgdir}/usr/include/"{CAL,OVDecode}
  install -m644 ./include/CAL/{calcl.h,cal_ext.h,cal_ext_counter.h,cal.h} "${pkgdir}/usr/include/CAL/"
  #install -m644 ./include/CL/{cl_agent_amd.h,cl_icd.h} "${pkgdir}/usr/include/CL/"
  install -m644 ./include/OVDecode/{OVDecode.h,OVDecodeTypes.h} "${pkgdir}/usr/include/OVDecode"

  #Symlink libs
  mkdir -p "${pkgdir}/usr/lib"
  ln -s "${_ipath}/lib/${_arch}/libOpenCL.so" "${pkgdir}/usr/lib/libOpenCL.so"
  ln -s "${_ipath}/lib/${_arch}/libamdocl${_bits}.so" "${pkgdir}/usr/lib/libamdocl${_bits}.so"

  #Symlink binaries
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "${_ipath}/bin/${_arch}/clinfo" "${pkgdir}/usr/bin/clinfo"

  #Env vars
  mkdir -p "${pkgdir}/etc/profile.d"
  cd "${pkgdir}/etc/profile.d"
  echo '#!/bin/sh' > amdstream.sh
  echo "export AMDAPPSDKROOT=${_ipath}/" >> amdstream.sh
  echo "export AMDAPPSDKSAMPLESROOT=${_ipath}/" >> amdstream.sh

  #Fix modes
  find "${pkgdir}/${_ipath}/" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}/${_ipath}/bin/${_arch}/clinfo"
  chmod 755 "${pkgdir}/${_ipath}/lib/${_arch}/"*.so
  find "${pkgdir}/${_ipath}/samples/" -type f -not -name "*.*" -path "*/${_arch}/*" -exec chmod 755 {} \;
}
