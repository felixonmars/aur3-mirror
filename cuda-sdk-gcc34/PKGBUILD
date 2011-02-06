# Maintainer: Carson Reynolds <carson@k2.t.u-tokyo.ac.jp>
# Based upon cuda-sdk PKGBUILD by Lawrence Lee

pkgname=cuda-sdk-gcc34
pkgver=2.10.1215.2015
_pkgver=2.10.1215.2015-3233425
pkgrel=1
pkgdesc="NVIDIA's CUDA architecture can be programmed in the only C language environment that unlocks the processing power of GPUs to solve the most complex compute-intensive challenges."
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://www.nvidia.com/object/cuda_home.html"
license=('custom')
depends=('cuda-toolkit'
	 'freeglut'
	 'gcc34')
source=(http://developer.download.nvidia.com/compute/cuda/2_1/SDK/cuda-sdk-linux-${_pkgver}.run
        common.mk.x86_64.patch
        common.mk.gcc-3.4.patch)
md5sums=('7a0548c814e629eb00484b068e58cdbb'
         '118332d292df64941dd850da2bd15e3f'
         '5cfec174040d32c5c15276a3e9a6bfaa')
build() {
  #Make directories
  mkdir -p $pkgdir/usr/share/licenses/cuda-sdk-gcc34
  mkdir -p $pkgdir/usr/share/doc/cuda-sdk-gcc34
  mkdir -p $pkgdir/usr/share/cuda-sdk-gcc34/bin
  mkdir -p $pkgdir/usr/share/cuda-sdk-gcc34/lib
  mkdir -p $pkgdir/usr/share/cuda-sdk-gcc34/releaseNotesData
  mkdir -p $pkgdir/usr/share/cuda-sdk-gcc34/tools

  #Create links for gcc-3.4 build environment
  mkdir -p $pkgdir/usr/share/cuda-sdk-gcc34/bin
  ln -s /usr/bin/gcc-3.4 $pkgdir/usr/share/cuda-sdk-gcc34/bin/gcc
  ln -s /usr/bin/g++-3.4 $pkgdir/usr/share/cuda-sdk-gcc34/bin/g++  

  #Extract the SDK
  cd $srcdir
  sh cuda-sdk-linux-${_pkgver}.run --noexec --keep --nox11 &> /dev/null
  
  #Copy over folders
  cp -rf $srcdir/pkg/sdk/common $pkgdir/usr/share/cuda-sdk-gcc34
  cp -rf $srcdir/pkg/sdk/projects $pkgdir/usr/share/cuda-sdk-gcc34
  #TODO: data really belongs elsewhere, however many sdk samples would need a rewrite
  cp -rf $srcdir/pkg/sdk/projects/*/data $pkgdir/usr/share/cuda-sdk-gcc34/bin

  #Build the SDK
  cd $srcdir/pkg/sdk/common
  [ "$CARCH" = "x86_64" ] && patch -p0 -i $srcdir/common.mk.x86_64.patch
  patch -p0 -i $srcdir/common.mk.gcc-3.4.patch || return 1
  sed -e 's/CUDA_INSTALL_PATH\ ?=\ \/usr\/local\/cuda/CUDA_INSTALL_PATH\ ?=\ \/usr/g' -i $srcdir/pkg/sdk/common/common.mk
  sed -i 's|GCC34DIR|'"$pkgdir"'/usr/share/cuda-sdk-gcc34/bin|' $srcdir/pkg/sdk/common/common.mk
  cd $srcdir/pkg/sdk
  make || return 1
  
  #Install the files
  install -m 755 $srcdir/pkg/sdk/bin/linux/release/* $pkgdir/usr/share/cuda-sdk-gcc34/bin
  install -m 755 $srcdir/pkg/sdk/lib/* $pkgdir/usr/share/cuda-sdk-gcc34/lib
  install -m 755 $srcdir/pkg/sdk/releaseNotesData/* $pkgdir/usr/share/cuda-sdk-gcc34/releaseNotesData
  install -m 755 $srcdir/pkg/sdk/tools/* $pkgdir/usr/share/cuda-sdk-gcc34/tools
  mv $srcdir/pkg/sdk/doc/cudpp_license.txt $pkgdir/usr/share/licenses/cuda-sdk-gcc34
  mv $srcdir/pkg/sdk/doc/license.txt $pkgdir/usr/share/licenses/cuda-sdk-gcc34
  install -m 644 $srcdir/pkg/sdk/doc/* $pkgdir/usr/share/doc/cuda-sdk-gcc34
}

#TODO: dxtc & simpleTexture must run as root since the data directory is not writable by default
#TODO: matrixMulDrv & simpleTexture are not passing tests
