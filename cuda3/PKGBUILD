# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Carson Reynolds <carson@k2.t.u-tokyo.ac.jp>
#
# A x86_64 binary version of this package is available from my custom
# repository. If you wish to use it, just add the following lines to your
# /etc/pacman.conf:
#   [schnouki]
#   Server = http://repo.schnouki.net/archlinux/$arch
# Then run "pacman -Sy cuda3" as root.

pkgname=cuda3
pkgver=3.2.16
pkgrel=1
pkgdesc="NVIDIA Compute Unified Device Architecture"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/object/cuda_home.html"
license=('custom')
depends=('cuda3-toolkit>=3.2.16-1' 'cuda3-sdk>=3.2.16-1')
provides=("cuda=$pkgver")
conflicts=('cuda')

build() {
  echo "cuda3 is a meta-package which provides the Cuda toolkit and SDK C and OpenCL samples"
}
