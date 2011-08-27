# Contributor: Andreas Schrafl <andy@jetnet.ch>
pkgname=colinux-modules
_pkgdate=20110205
_kernelver=2.6.33.7
pkgver=0.7.9
pkgrel=0
pkgdesc="coLinux Kernel ${_kernelver} Modules"
arch=('i686')
url="http://www.henrynestler.com/colinux/testing/stable-${pkgver}/${_pkgdate}-Snapshot/packages"
license=('GPL')
source=(${url}/modules-${_kernelver}-co-${pkgver}-${_pkgdate}.tgz)
md5sums=('adb01608381a5b2c1dbef9187f4fc887')


build() {
 tar -xzf $srcdir/modules-${_kernelver}-co-${pkgver}-${_pkgdate}.tgz -C $pkgdir
}
