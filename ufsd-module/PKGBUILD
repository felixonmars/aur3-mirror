# Contributor: Kowalczyk Patryk <patryk AT kowalczyk DOT ws>
# Contributor: <John freehaha  at gmail  dot com> - patch paragon-ufsd-3.10_v01.patch
# Maintainer: codestation <codestation404 at gmail dot com>

pkgname=ufsd-module
pkgver=8.9.0
pkgrel=3
_kernver=`uname -r`
_srcdir=Paragon_NTFS_HFS_Linux_${pkgver}_Express
pkgdesc='Paragon NTFS & HFS for Linux driver. - ACLs removed'
arch=('i686' 'x86_64')
url='http://paragon-software.com/'
license=('custom')
depends=('linux<3.16')
makedepends=('linux-headers')
options=(strip)
install=${pkgname}.install
source=("Paragon-147-FRE_NTFS_Linux_8.9.0_Express.tar.gz" 
	"001-paragon-ufsd-arch.patch"
	"paragon-ufsd-3.15.patch")

md5sums=('1663f34557d3e055f15a0534f88ff509'
         '021902e32bfee3aee7d65c2b2687982c'
         'd380beb8def8d4f04a322c58db5128ed')

prepare() {
  cd ${srcdir}/
  patch -p2 < 001-paragon-ufsd-arch.patch
  patch -p1 < paragon-ufsd-3.15.patch
}

build() {
  cd ${srcdir}/
  ./configure --prefix=/usr --sbindir=/usr/bin
  make driver
}

package() {
  cd ${srcdir}/
  make install DESTDIR=${pkgdir}
  install -D ufsd.ko "${pkgdir}/usr/lib/modules/${_kernver}/extra/ufsd.ko"
  install -D jnl.ko "${pkgdir}/usr/lib/modules/${_kernver}/extra/jnl.ko"
  sed -i "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" "${startdir}/${pkgname}.install"
}
