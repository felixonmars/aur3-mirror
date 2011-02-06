# Maintainer: Vojtech Kral <kral.vojtech at gmail>
# Contributor: pfdm
# Contributor: Vi0L0
# Contributor: caust1c

pkgname=amdstream
pkgver=2.3
pkgrel=5
pkgdesc="AMD Accelerated Parallel Processing (APP) SDK, formerly known as ATI Stream, now wtih OpenCL support"
arch=('i686' 'x86_64')
url="http://developer.amd.com/gpu/ATIStreamSDK/Pages/default.aspx"
license=("custom")
install=note.install

provides=('opencl' 'libcl')
depends=('libatical>=10.11' 'libgl' 'llvm' 'gcc-libs' 'mesa' 'opencl-headers')
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
source=("http://download2-developer.amd.com/amd/Stream20GA/ati-stream-sdk-v$pkgver-lnx$_bits.tgz")

#sha256sums
sha256sums=('07fd15a51a678c4378767f61466daf9da21d0bab6088a97a70136dd8c976aca6')
[ "$CARCH" = "x86_64" ] && sha256sums=('f92537d1fc306af0bff1441af4669bf2fa668654b12d9fb53a3a872dc8826cad')

build()
{
  cd "$srcdir/ati-stream-sdk-v$pkgver-lnx$_bits"
  make -j1
}

package()
{
  cd "$srcdir/ati-stream-sdk-v$pkgver-lnx$_bits"

  #Install SDK
  mkdir -p $pkgdir/opt/amdstream
  cp -r {glut_notice.txt,docs,include,samples} $pkgdir/opt/amdstream/
  mkdir -p $pkgdir/opt/amdstream/{bin/$_arch,lib,samples}
  cp -r ./bin/$_arch/clc $pkgdir/opt/amdstream/bin/$_arch/clc
  cp -r ./lib/$_arch $pkgdir/opt/amdstream/lib/
  cp -r ./lib/gpu $pkgdir/opt/amdstream/lib/
  rm -rf $pkgdir/opt/amdstream/samples/opencl/bin/$_other_arch
  rm -rf $pkgdir/opt/amdstream/samples/cal/bin/$_other_arch

  #Register ICD
  tar -zxvf icd-registration.tgz > /dev/null
  cp -r etc $pkgdir/

  #Insall includes
  mkdir -p $pkgdir/usr/include/CL
  install -m644 ./include/{calcl.h,cal_ext.h,cal_ext_counter.h,cal.h} $pkgdir/usr/include/
  install -m644 ./include/CL/{cl_agent_amd.h,cl_icd.h} $pkgdir/usr/include/CL/
  mkdir -p $pkgdir/usr/include/OVDecode
  install -m644 ./include/OVDecode/{OVDecode.h,OVDecodeTypes.h} $pkgdir/usr/include/OVDecode

  #Symlink binaries
  mkdir -p $pkgdir/usr/bin
  ln -s /opt/amdstream/bin/$_arch/clc $pkgdir/usr/bin/

  #Add stream libs to shared library path
  mkdir -p $pkgdir/etc/ld.so.conf.d
  cd $pkgdir/etc/ld.so.conf.d
  echo /opt/amdstream/lib/$_arch > amdstream.conf
  echo /opt/amdstream/lib/gpu >> amdstream.conf

  #More docs and export
  mkdir -p $pkgdir/etc/profile.d
  cd $pkgdir/etc/profile.d
  echo "#!/bin/sh" > amdstream.sh
  echo "export AMDSTREAMSDKROOT=/opt/amdstream/" >> amdstream.sh
  echo "export AMDSTREAMSDKSAMPLEROOT=/opt/amdstream/" >> amdstream.sh

  #Fix modes
  find $pkgdir/opt/amdstream/ -type f -exec chmod 644 {} \;
  chmod 755 $pkgdir/opt/amdstream/bin/$_arch/clc
  chmod 755 $pkgdir/opt/amdstream/lib/$_arch/*.so
  find $pkgdir/opt/amdstream/samples/ -type f -not -name "*.*" -path "*/$_arch/*" -exec chmod 755 {} \;
}
