# Maintainer: Carson Reynolds <carson@k2.t.u-tokyo.ac.jp>
# Contributor: Lawrence Lee <valheru AT facticius DOT net>
# Contributor: Ismael Barros Barros <razielmine@gmail.com>

pkgname=cuda-sdk-old
pkgver=2.2
_pkgver=2.2
pkgrel=1
pkgdesc="NVIDIA's CUDA architecture can be programmed in the only C language environment that unlocks the processing power of GPUs to solve the most complex compute-intensive challenges."
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://www.nvidia.com/object/cuda_home.html"
license=('custom')
depends=('cuda-toolkit-old'
	 'freeglut'
	 'gcc43')
source=(http://developer.download.nvidia.com/compute/cuda/2_2/sdk/cudasdk_${_pkgver}_linux.run
	common.mk.patch)
md5sums=('6ba1f419a88139530c0e82176bb1a8af' 'fa0a2c93ecc9bcdca8ce4c644572d62a')
build() {
  #Make directories
  mkdir -p $pkgdir/usr/share/licenses/cuda-sdk
  mkdir -p $pkgdir/usr/share/doc/cuda-sdk
  mkdir -p $pkgdir/usr/share/cuda-sdk/bin
  mkdir -p $pkgdir/usr/share/cuda-sdk/lib
  mkdir -p $pkgdir/usr/share/cuda-sdk/releaseNotesData
  mkdir -p $pkgdir/usr/share/cuda-sdk/tools

  #Create links for gcc-3.4 build environment
  mkdir -p $pkgdir/usr/share/cuda-sdk/bin
  ln -s /usr/bin/gcc-4.3 $pkgdir/usr/share/cuda-sdk/bin/gcc
  ln -s /usr/bin/g++-4.3 $pkgdir/usr/share/cuda-sdk/bin/g++  

  #Extract the SDK
  cd $srcdir
  sh cudasdk_${_pkgver}_linux.run --noexec --keep --nox11 &> /dev/null
  
  #Build the SDK
  patch -p0 -i $srcdir/common.mk.patch || return 1
  sed -i 's|GCC34DIR|'"$pkgdir"'/usr/share/cuda-sdk/bin|' $srcdir/pkg/sdk/common/common.mk
  #echo "check x86 patch"
  #read   
  cd $srcdir/pkg/sdk
  CUDA_INSTALL_PATH=/usr make || return 1
  
  #Copy over folders
  cp -rf $srcdir/pkg/sdk/ $pkgdir/usr/share/cuda-sdk

  #Install the files
  install -m 755 $srcdir/pkg/sdk/bin/linux/release/* $pkgdir/usr/share/cuda-sdk/bin
  mv $srcdir/pkg/sdk/doc/cudpp_license.txt $pkgdir/usr/share/licenses/cuda-sdk
  mv $srcdir/pkg/sdk/doc/license.txt $pkgdir/usr/share/licenses/cuda-sdk
  install -m 644 $srcdir/pkg/sdk/doc/* $pkgdir/usr/share/doc/cuda-sdk
}

#TODO: dxtc & simpleTexture must run as root since the data directory is not writable by default
#TODO: matrixMulDrv & simpleTexture are not passing tests
