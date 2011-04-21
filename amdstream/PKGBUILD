# Maintainer: Vojtech Kral <kral.vojtech at gmail>
# Contributor: pfdm
# Contributor: Vi0L0
# Contributor: caust1c

pkgname=amdstream
pkgver=2.4
pkgrel=1
_OpenCL_ver_major=1
_OpenCL_ver_minor=1
pkgdesc="AMD Accelerated Parallel Processing (APP) SDK, formerly known as ATI Stream, now wtih OpenCL support (libcl)"
arch=('i686' 'x86_64')
url="http://developer.amd.com/gpu/ATIStreamSDK/Pages/default.aspx"
license=("custom")
install=install

provides=('opencl' 'libcl')
depends=('libatical>=11.3' 'opencl-headers' 'libgl' 'llvm' 'gcc-libs' 'mesa' 'glut' 'glew')
optdepends=('catalyst: for CAL and OpenCL GPU acceleration on AMD ATi graphics cards')
makedepends=('perl' 'llvm')
conflicts=('nvidia-opencl' )

#Architecture resolution
_arch="x86"
_other_arch="x86_64"
_bits="32"
[ "$CARCH" = "x86_64" ] && _arch="x86_64"
[ "$CARCH" = "x86_64" ] && _other_arch="x86"
[ "$CARCH" = "x86_64" ] && _bits="64"

#Sources
source=("http://download2-developer.amd.com/amd/APPSDK/AMD-APP-SDK-v$pkgver-lnx$_bits.tgz")

#sha256sums
sha256sums=('de59238c792a420703449786e19fd8abeafee40a185aa934364196422747958c')
[ "$CARCH" = "x86_64" ] && sha256sums=('2aa32269d206dd4e48580cc0e5aee03f4d9d9c539b10e8f29d0a21461a58a34a')

build()
{
  cd "$srcdir/AMD-APP-SDK-v$pkgver-lnx$_bits"
  make -j1    #With -j other than one, build failes on ceratin configurations
}

package()
{
  cd "$srcdir/AMD-APP-SDK-v$pkgver-lnx$_bits"

  #Install SDK
  mkdir -p $pkgdir/opt/amdstream
  cp -r {glut_notice.txt,docs,include,samples} $pkgdir/opt/amdstream/
  mkdir -p $pkgdir/opt/amdstream/{bin/$_arch,lib,samples}
  cp -r ./bin/$_arch/clinfo $pkgdir/opt/amdstream/bin/$_arch/clinfo
  cp -r ./lib/$_arch $pkgdir/opt/amdstream/lib/
  rm -rf $pkgdir/opt/amdstream/samples/opencl/bin/$_other_arch
  rm -rf $pkgdir/opt/amdstream/samples/cal/bin/$_other_arch

  #Register ICD
  tar -zxvf icd-registration.tgz > /dev/null
  cp -r etc $pkgdir/

  #Insall includes
  mkdir -p $pkgdir/usr/include/{CAL,OVDecode}
  install -m644 ./include/CAL/{calcl.h,cal_ext.h,cal_ext_counter.h,cal.h} $pkgdir/usr/include/CAL/
  #install -m644 ./include/CL/{cl_agent_amd.h,cl_icd.h} $pkgdir/usr/include/CL/
  install -m644 ./include/OVDecode/{OVDecode.h,OVDecodeTypes.h} $pkgdir/usr/include/OVDecode

  #Add stream libs to shared library path   -- In this pkgrel I'll try avoid this, it's not good. In case of troubles, I'll revert it back...
  #mkdir -p $pkgdir/etc/ld.so.conf.d
  #cd $pkgdir/etc/ld.so.conf.d
  #echo /opt/amdstream/lib/$_arch > amdstream.conf
  #echo /opt/amdstream/lib/gpu >> amdstream.conf

  #Symlink libs (instead)
  mkdir -p $pkgdir/usr/lib
  ln -s /opt/amdstream/lib/$_arch/libOpenCL.so $pkgdir/usr/lib/libOpenCL.so.$_OpenCL_ver_major.$_OpenCL_ver_minor
  ln -s /usr/lib/libOpenCL.so.$_OpenCL_ver_major.$_OpenCL_ver_minor $pkgdir/usr/lib/libOpenCL.so.$_OpenCL_ver_major
  ln -s /usr/lib/libOpenCL.so.$_OpenCL_ver_major.$_OpenCL_ver_minor $pkgdir/usr/lib/libOpenCL.so
  ln -s /opt/amdstream/lib/$_arch/libamdocl64.so $pkgdir/usr/lib/libamdocl64.so

  #Symlink binaries
  mkdir -p $pkgdir/usr/bin
  ln -s /opt/amdstream/bin/$_arch/clinfo $pkgdir/usr/bin/clinfo

  #Env vars
  mkdir -p $pkgdir/etc/profile.d
  cd $pkgdir/etc/profile.d
  echo "#!/bin/sh" > amdstream.sh
  echo "export AMDAPPSDKROOT=/opt/amdstream/" >> amdstream.sh
  echo "export AMDAPPSDKSAMPLESROOT=/opt/amdstream/" >> amdstream.sh

  #Fix modes
  find $pkgdir/opt/amdstream/ -type f -exec chmod 644 {} \;
  chmod 755 $pkgdir/opt/amdstream/bin/$_arch/clinfo
  chmod 755 $pkgdir/opt/amdstream/lib/$_arch/*.so
  find $pkgdir/opt/amdstream/samples/ -type f -not -name "*.*" -path "*/$_arch/*" -exec chmod 755 {} \;
}
