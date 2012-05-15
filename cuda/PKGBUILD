# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Carson Reynolds <carson@k2.t.u-tokyo.ac.jp>
#
# A x86_64 binary version of this package is available from my custom
# repository. If you wish to use it, just add the following lines to your
# /etc/pacman.conf:
#   [schnouki]
#   Server = http://repo.schnouki.net/archlinux/$arch
# Then run "pacman -Sy cuda" as root.

pkgname=cuda
pkgver=4.1.29
pkgrel=1
pkgdesc="NVIDIA Compute Unified Device Architecture"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/object/cuda_home.html"
license=('custom')
depends=("cuda-toolkit>=$pkgver" "cuda-sdk>=$pkgver")

build() {
  echo "cuda is a meta-package which provides the CUDA toolkit and SDK C and OpenCL samples"
}
