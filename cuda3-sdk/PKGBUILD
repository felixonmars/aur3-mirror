# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Carson Reynolds <carson@k2.t.u-tokyo.ac.jp>
#
# A x86_64 binary version of this package is available from my custom
# repository. If you wish to use it, just add the following lines to your
# /etc/pacman.conf:
#   [schnouki]
#   Server = http://repo.schnouki.net/archlinux/$arch
# Then run "pacman -Sy cuda3-sdk" as root.

pkgname=cuda3-sdk
_pkgname=cuda-sdk
pkgver=3.2.16
pkgrel=1
_shortver=3_2
pkgdesc="NVIDIA's CUDA architecture can be programmed in the only C language environment that unlocks the processing power of GPUs to solve the most complex compute-intensive challenges."
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://www.nvidia.com/object/cuda_home.html"
license=('custom')
depends=("cuda3-toolkit>=${pkgver}"
         'nvidia>=260.19.21'
	 'freeglut'
	 'gcc44')
provides=("cuda-sdk=$pkgver")
conflicts=('cuda-sdk')
source=(http://developer.download.nvidia.com/compute/cuda/${_shortver}_prod/sdk/gpucomputingsdk_${pkgver}_linux.run
	common.mk.patch)
md5sums=('6f58a696627a236aed20c1f2cd9c74bf'
         'cdfaddbd4c69f4f25a84e91991b2c45d')

build() {
  # Extract the SDK
  cd $srcdir
  sh gpucomputingsdk_${pkgver}_linux.run --noexec --keep --nox11 &> /dev/null
  
  # Inspection hook
  #echo "Inspect srcdir"
  #read 

  # Patch the Makefile
  cp pkg/sdk/C/common/common.mk pkg/sdk/C/common/common.mk.original
  patch -p0 -i $srcdir/common.mk.patch

  # Build the C SDK
  cd $srcdir/pkg/sdk/C
  make

  # Build the OpenCL SDK
  cd $srcdir/pkg/sdk/OpenCL
  make
}

package() {
  # Make directories
  mkdir -p $pkgdir/usr/share/licenses/cuda-sdk
  mkdir -p $pkgdir/usr/share/doc/cuda-sdk/{C,OpenCL}/releaseNotesData
  mkdir -p $pkgdir/usr/share/cuda-sdk/{C,OpenCL}/bin/data
  
  # Install the binaries
  install -m755 $srcdir/pkg/sdk/C/bin/linux/release/* $pkgdir/usr/share/cuda-sdk/C/bin
  install -m755 $srcdir/pkg/sdk/OpenCL/bin/linux/release/* $pkgdir/usr/share/cuda-sdk/OpenCL/bin

  # Install license information
  install -m644 $srcdir/pkg/sdk/cudpp_license.txt $pkgdir/usr/share/licenses/cuda-sdk
  install -m644 $srcdir/pkg/sdk/License.txt $pkgdir/usr/share/licenses/cuda-sdk
 
  # Install documentation files
  install -m644 $srcdir/pkg/sdk/C/doc/*.rtf $srcdir/pkg/sdk/C/Samples.html $pkgdir/usr/share/doc/cuda-sdk/C
  install -m644 $srcdir/pkg/sdk/OpenCL/doc/*.pdf $srcdir/pkg/sdk/OpenCL/Samples.html $pkgdir/usr/share/doc/cuda-sdk/OpenCL
  install -m644 $srcdir/pkg/sdk/C/releaseNotesData/* $pkgdir/usr/share/doc/cuda-sdk/C/releaseNotesData
  install -m644 $srcdir/pkg/sdk/OpenCL/releaseNotesData/* $pkgdir/usr/share/doc/cuda-sdk/OpenCL/releaseNotesData

  # Copy over source and lib folders
  cp -R $srcdir/pkg/sdk/C/{common,lib,src} $pkgdir/usr/share/cuda-sdk/C
  cp -R $srcdir/pkg/sdk/OpenCL/{common,src} $pkgdir/usr/share/cuda-sdk/OpenCL
  cp -R $srcdir/pkg/sdk/shared $pkgdir/usr/share/cuda-sdk

  # Remove left-over object and ptx files
  find $pkgdir/usr/share/cuda-sdk -depth -type d -name 'obj' -exec rm -rf \{\} \;
  find $pkgdir/usr/share/cuda-sdk -type f -name '*.ptx' -exec rm -rf \{\} \;

  # Copy data files for SDK
  find $srcdir/pkg/sdk/C/src/ | grep '/data/' | \
    xargs -I '{}' cp '{}' $pkgdir/usr/share/cuda-sdk/C/bin/data
  find $srcdir/pkg/sdk/OpenCL/src/ | grep '/data/' | \
    xargs -I '{}' cp '{}' $pkgdir/usr/share/cuda-sdk/OpenCL/bin/data
}

# NOTE: demos such as bandwidthTest, dxtc and simpleTexture may pass tests 
#       when run as root since the data directory is not writable by default.
# NOTE: if building with nvcc use the following flags:
# --compiler-options -fpermissive --compiler-bindir=/opt/gcc-4.4
