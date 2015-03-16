# Maintainer: fabien Cellier <fabien.cellier@@gmail.com>

_pkgname=pocl
pkgname=$_pkgname
#pkgname=$_pkgname-bzr
pkgver=0.11
pkgrel=1
pkgdesc="Portable OpenCL is an open-source implementation of OpenCL which can be easily adapted for new targets"
arch=(i686 x86_64)
url="https://launchpad.net/pocl"
license=('GPL')
depends=('clang' 'libcl' 'hwloc' 'libltdl' 'opencl-headers')
source=("http://pocl.sourceforge.net/downloads/${_pkgname}-${pkgver}.tar.gz")
md5sums=('9be0640cde2983062c47393d9e8e8fe7')
options=(debug strip !staticlibs !libtool)
# pocl use pkg-config to find OpenCL, which is only provided in ocl-icd
makedepends=('ocl-icd' 'pkg-config')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  #
  # BUILD HERE
  #
  ./configure --enable-shared --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir/usr/include/CL"
}
