# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Carson Reynolds <carson@k2.t.u-tokyo.ac.jp>
#
# A x86_64 binary version of this package is available from my custom
# repository. If you wish to use it, just add the following lines to your
# /etc/pacman.conf:
#   [schnouki]
#   Server = http://repo.schnouki.net/archlinux/$arch
# Then run "pacman -Sy cuda-sdk" as root

pkgname=cuda-sdk
pkgver=4.1.28
pkgrel=1
pkgdesc="NVIDIA's CUDA architecture can be programmed in the only C language environment that unlocks the processing power of GPUs to solve the most complex compute-intensive challenges."
arch=('i686' 'x86_64')
url="http://www.nvidia.com/object/cuda_home.html"
license=('custom')
depends=("cuda-toolkit>=${pkgver}"
         'nvidia>=290.10'
         'opencl-nvidia'
	 'freeglut'
         'libxmu')
makedepends=('perl')
provides=("cuda-sdk=${pkgver}")
conflicts=("cuda-sdk")
source=(http://developer.download.nvidia.com/compute/cuda/4_1/rel/sdk/gpucomputingsdk_${pkgver}_linux.run)
md5sums=('e2ac3211521ad0706bbf1d4393e2d231')
sha256sums=('1d6c6b6b25ae70d7a725cb89a06644b7101a63c1508bce69daacd32b32b0f6f9')

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
  install -dm755 "$pkgdir/opt/cuda-sdk"
  ./install-sdk-linux.pl --prefix="$pkgdir/opt/cuda-sdk" --cudaprefix="/opt/cuda-toolkit" >/dev/null

  msg2 "Building all examples..."
  cd "$pkgdir/opt/cuda-sdk"
  make CUDA_INSTALL_PATH=/opt/cuda-toolkit NO_MPI=1
  # simpleMPI sometimes causes segfaults when building...

  msg2 "Linking license file..."
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -s ../../../../opt/cuda-sdk/License.txt "$pkgdir/usr/share/licenses/$pkgname/License.txt"
}

# Everything is done in build(), so no need for a package() function.

# NOTE: demos such as bandwidthTest, dxtc and simpleTexture may pass tests 
#       when run as root since the data directory is not writable by default.
