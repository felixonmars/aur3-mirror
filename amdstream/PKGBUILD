# Maintainer: Vojtech Kral <kral.vojtech at gmail>
# Contributor: pfdm
# Contributor: Vi0L0
# Contributor: caust1c

# TODO: license in proper dir


pkgname=amdstream
pkgver=2.6
pkgrel=1
_profiler_ver=2.4

pkgdesc='AMD Accelerated Parallel Processing (APP) SDK, formerly known as ATI
         Stream, now wtih limited OpenCL 1.2 support'
arch=('i686' 'x86_64')
url="http://developer.amd.com/sdks/AMDAPPSDK/Pages/default.aspx"
license=("custom")
install=install

provides=('opencl')
depends=('libcl' 'libgl' 'llvm' 'gcc-libs' 'mesa' 'glut' 'glew')
optdepends=('opencl-headers: for development'
            'catalyst: for OpenCL on AMD GPU')
makedepends=('perl' 'llvm')

#Architecture resolution
_arch="${CARCH/i6/x}"
_bits=${_arch/x86/32}
_bits=${_bits/32_/}
[ "$CARCH" = 'x86_64' ] && _hash='3042dafb0fbe3e61585b53f23f9d2d568888df01f39cbb12ee74118dca2845ba' \
                        || _hash='b50516cf4372c61199698bc204fa12feafea83b0c87bfdcd002639422ede7e0f'

#Sources
source=("http://developer.amd.com/Downloads/AMD-APP-SDK-v${pkgver}-lnx${_bits}.tgz" \
        '01-implicit-linking.patch')

#sha256sums
sha256sums=($_hash '25781556b6441c26449e5577ea068eda74fb2dc520004897c64482cedb6fac0e' )

_subdir="AMD-APP-SDK-v2.6-RC3-lnx${_bits}"

#Install path
_ipath='opt/amdstream'

build()
{
  cd "${srcdir}"
  tar xf ${_subdir}.tgz
  cd "${_subdir}"
  patch -p0 < ../../01-implicit-linking.patch
  make -j1   # With -j other than one, build fails (at least on ceratin configurations).
}

package()
{
  cd "${srcdir}/${_subdir}"

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
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/${_ipath}/bin/sprofile" "${pkgdir}/usr/bin/sprofile"

  #Licenses
  mkdir -p "${pkgdir}/${_ipath}/licenses"
  mkdir -p "${pkgdir}/usr/share/licenses"
  install -m644 ./LICENSE-llvm.txt "${pkgdir}/${_ipath}/licenses/"
  install -m644 ./LICENSE-llvm.txt "${pkgdir}/usr/share/licenses/"
  install -m644 "./tools/AMDAPPProfiler-${_profiler_ver}/License.txt" "${pkgdir}/${_ipath}/licenses/LICENSE-profiler.txt"
  install -m644 "./tools/AMDAPPProfiler-${_profiler_ver}/License.txt" "${pkgdir}/usr/share/licenses/LICENSE-profiler.txt"

  #Register ICD
  mkdir -p "${pkgdir}/etc/OpenCL/vendors"
  echo "/${_ipath}/lib/libamdocl${_bits}.so" > "${pkgdir}/etc/OpenCL/vendors/amd.icd"
  # The OpenCL ICD specifications: http://www.khronos.org/registry/cl/extensions/khr/cl_khr_icd.txt

  #Install includes
  mkdir -p "${pkgdir}/usr/include/"{CAL,OpenVideo}
  install -m644 './include/CAL/'{calcl.h,cal_ext.h,cal_ext_counter.h,cal.h} "${pkgdir}/usr/include/CAL/"
  install -m644 './include/OpenVideo/'{OVDecode.h,OVDecodeTypes.h} "${pkgdir}/usr/include/OpenVideo/"

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
