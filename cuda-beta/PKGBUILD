# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Carson Reynolds <carson@k2.t.u-tokyo.ac.jp>
#
# WARNING: this is a package for a beta version of CUDA. If you need a stable
# and reliable version, please use the "cuda" package instead.
#
# A x86_64 binary version of this package is available from my custom
# repository. If you wish to use it, just add the following lines to your
# /etc/pacman.conf:
#   [schnouki]
#   Server = http://repo.schnouki.net/archlinux/$arch
# Then run "pacman -Sy cuda-beta" as root

pkgname=cuda-beta
pkgver=4.1.21
pkgrel=1
pkgdesc="NVIDIA Compute Unified Device Architecture"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/object/cuda_home.html"
license=('custom')
depends=("cuda-toolkit-beta>=$pkgver" "cuda-sdk-beta>=$pkgver")

build() {
  echo "cuda-beta is a meta-package which provides the CUDA toolkit and SDK C and OpenCL samples"
}
