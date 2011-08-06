# Maintainer: Vojtech Kral <kral.vojtech at gmail>
# Contributor: pfdm
# Contributor: Vi0L0
# Contributor: caust1c

pkgname=amdstream
pkgver=2.5
pkgrel=1
_profiler_ver=2.3

pkgdesc='AMD Accelerated Parallel Processing (APP) SDK, formerly known as ATI Stream, now wtih OpenCL support'
arch=('i686' 'x86_64')
url="http://developer.amd.com/gpu/ATIStreamSDK/Pages/default.aspx"
license=("custom")
install=install

provides=('opencl')
depends=('opencl-headers' 'libcl' 'libgl' 'llvm' 'gcc-libs' 'mesa' 'glut' 'glew')
optdepends=('catalyst: for OpenCL on AMD GPU'
            'libopencl: Alternative libcl provider (original AMD-APP one) - supports OpenCL 1.1')
makedepends=('perl' 'llvm')

#Architecture resolution
_arch="${CARCH/i6/x}"
_bits=${_arch/x86/32}
_bits=${_bits/32_/}
[ "$CARCH" = 'x86_64' ] && _hash='b121183f4ce5d296d5195ec2fbb8f857f44ec79fc2daceaf8aea815189351787' \
                        || _hash='01ff3b55f2f5a702bd54bb8641c67b86397d383e9a8b8c1ba629181f86da15ca'

#Sources
source=("http://developer.amd.com/Downloads/AMD-APP-SDK-v${pkgver}-lnx${_bits}.tgz" 
        "AMD-APP-SDK-v2.5-RC2-lnx${_bits}.tgz")

#sha256sums
sha256sums=($_hash 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

#Install path
_ipath='opt/amdstream'

build()
{
  cd "${srcdir}/AMD-APP-SDK-v2.5-RC2-lnx${_bits}"
  make -j1   # With -j other than one, build fails (at least on ceratin configurations).
}

package()
{
  cd "${srcdir}/AMD-APP-SDK-v2.5-RC2-lnx${_bits}"

  #Install SDK
  mkdir -p "${pkgdir}/${_ipath}"
  cp -r {glut_notice.txt,docs,include} "${pkgdir}/${_ipath}/"
  mkdir -p "${pkgdir}/${_ipath}/"{bin,lib,samples/opencl/bin}
  cp -r "./bin/${_arch}/clinfo" "${pkgdir}/${_ipath}/bin/clinfo"
  cp -r "./lib/${_arch}/"* "${pkgdir}/${_ipath}/lib/"
  find ./samples/opencl/ -mindepth 1 -maxdepth 1 -type d -not -name bin -exec cp -r {} "${pkgdir}/${_ipath}/samples/opencl" \;
  cp -r "./samples/opencl/bin/${_arch}/"* "${pkgdir}/${_ipath}/samples/opencl/bin"

  #Install Profiler
  cp "./tools/AMDAPPProfiler-${_profiler_ver}/${_arch}/"* "${pkgdir}/${_ipath}/bin/"
  cp "./tools/AMDAPPProfiler-${_profiler_ver}/CLPerfMarker/bin/${_arch}/"* "${pkgdir}/${_ipath}/bin/"
  mkdir -p "${pkgdir}/${_ipath}/docs/AMDAPPProfiler"
  cp "./tools/AMDAPPProfiler-${_profiler_ver}/html/"* "${pkgdir}/${_ipath}/docs/AMDAPPProfiler/"
  cp "./tools/AMDAPPProfiler-${_profiler_ver}/AMDAPPProfiler.html" "${pkgdir}/${_ipath}/docs/AMDAPPProfiler-ReleaseNotes.html"

  #Licenses
  mkdir -p "${pkgdir}/${_ipath}/licenses"
  install -m644 ./LICENSE-*.txt "${pkgdir}/${_ipath}/licenses/"
  install -m644 "./tools/AMDAPPProfiler-${_profiler_ver}/License.txt" "${pkgdir}/${_ipath}/licenses/LICENSE-profiler.txt"

  #Register ICD
  mkdir -p "${pkgdir}/etc/OpenCL/vendors"
  echo "/${_ipath}/lib/libamdocl${_bits}.so" > "${pkgdir}/etc/OpenCL/vendors/amd.icd"
  # The OpenCL ICD specifications: http://www.khronos.org/registry/cl/extensions/khr/cl_khr_icd.txt

  #Insall includes
  mkdir -p "${pkgdir}/usr/include/"{CAL,OVDecode}
  install -m644 './include/CAL/'{calcl.h,cal_ext.h,cal_ext_counter.h,cal.h} "${pkgdir}/usr/include/CAL/"
  install -m644 './include/OVDecode/'{OVDecode.h,OVDecodeTypes.h} "${pkgdir}/usr/include/OVDecode/"

  #Symlink libs                                                                       # ---> moved to libcl
  #mkdir -p "${pkgdir}/usr/lib"
  #ln -s "/${_ipath}/lib/libOpenCL.so" "${pkgdir}/usr/lib/libOpenCL.so"

  #Symlink binaries
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/${_ipath}/bin/clinfo" "${pkgdir}/usr/bin/clinfo"

  #Env vars
  mkdir -p "${pkgdir}/etc/profile.d"
  cd "${pkgdir}/etc/profile.d"
  echo '#!/bin/sh' > amdstream.sh
  echo "export AMDAPPSDKROOT=/${_ipath}/" >> amdstream.sh
  echo "export AMDAPPSDKSAMPLESROOT=/${_ipath}/" >> amdstream.sh

  #Fix modes
  find "${pkgdir}/${_ipath}/" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}/${_ipath}/bin/"*
  chmod 755 "${pkgdir}/${_ipath}/lib/"*
  find "${pkgdir}/${_ipath}/samples/opencl/bin" -type f -not -name "*.*" -exec chmod 755 {} \;
}
