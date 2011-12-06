# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Carson Reynolds <carson@k2.t.u-tokyo.ac.jp>
#
# WARNING: this is a package for a beta version of CUDA. If you need a stable
# and reliable version, please use the "cuda-sdk" package instead.
#
# A x86_64 binary version of this package is available from my custom
# repository. If you wish to use it, just add the following lines to your
# /etc/pacman.conf:
#   [schnouki]
#   Server = http://repo.schnouki.net/archlinux/$arch
# Then run "pacman -Sy cuda-sdk-beta" as root

pkgname=cuda-sdk-beta
_pkgname=cuda-sdk
pkgver=4.1.21
pkgrel=1
pkgdesc="NVIDIA's CUDA architecture can be programmed in the only C language environment that unlocks the processing power of GPUs to solve the most complex compute-intensive challenges."
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://www.nvidia.com/object/cuda_home.html"
license=('custom')
depends=("cuda-toolkit-beta>=${pkgver}"
         'nvidia>=285.05'
         'opencl-nvidia'
	 'freeglut'
         'libxmu')
makedepends=('perl')
provides=("cuda-sdk=${pkgver}")
conflicts=("cuda-sdk")
source=(http://developer.download.nvidia.com/compute/cuda/4_1/RC2/sdk/gpucomputingsdk_${pkgver}_linux.run)
md5sums=('272ffb1c6a30cb63b3e67583b91f5205')
sha256sums=('48f0fd56a2cffaa1188acbbd2750f0c772ca93f92ac21f40313ccc11f0c007af')

# This is ugly, but saves a lot of time: don't compress the package with xz.
#PKGEXT=".pkg.tar"

build() {
  cd "$srcdir"

  # Extract the SDK
  msg2 "Uncompressing the CUDA SDK..."  
  sh gpucomputingsdk_${pkgver}_linux.run --noexec --keep --nox11 >/dev/null
  cd pkg
  
  # Inspection hook
  #echo "Inspect srcdir"
  #read 

  msg2 "Patching Makefiles..."
  # Support parallel builds
  find . -name 'Makefile*' -exec sed -i 's/^\tmake /\t$(MAKE) /g; s/^\t@make /\t@$(MAKE) /g' "{}" +

  msg2 "Preparing the build environment"
  install -dm755 "$pkgdir/usr/cuda/sdk"
  ./install-sdk-linux.pl --prefix="$pkgdir/usr/cuda/sdk" --cudaprefix="/usr/cuda" >/dev/null

  msg2 "Building all examples..."
  cd "$pkgdir/usr/cuda/sdk"
  make CUDA_INSTALL_PATH=/usr/cuda NO_MPI=1
  # simpleMPI sometimes causes segfaults when building...
}

# Everything is done in build(), so no need for a package() function.

# NOTE: demos such as bandwidthTest, dxtc and simpleTexture may pass tests 
#       when run as root since the data directory is not writable by default.
