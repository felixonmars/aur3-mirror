# Maintainer: Kowalczyk Patryk <patryk AT kowalczyk DOT ws>
# Maintainer: <John freehaha  at gmail  dot com> - patch paragon-ufsd-3.10_v01.patch
# Maintainer: Pradeep Murthy <pradeepmur (at) gmail> (dkms wrapper)

pkgname=ufsd-module-dkms
_pkgname=ufsd-module
pkgver=8.9.0
_srcdir=Paragon_NTFS_HFS_Linux_${pkgver}_Express
pkgrel=3
pkgdesc='Paragon NTFS & HFS for Linux driver. - ACLs removed. DKMS version'
arch=('i686' 'x86_64')
url='http://paragon-software.com/'
license=('custom')
depends=('dkms' 'linux<3.16')
makedepends=('linux-headers')
install=install

source=("Paragon-147-FRE_NTFS_Linux_8.9.0_Express.tar.gz"
	"001-paragon-ufsd-arch.patch"
	"dkms.conf"
	"paragon-ufsd-3.15.patch"
)

md5sums=('1663f34557d3e055f15a0534f88ff509'
         '021902e32bfee3aee7d65c2b2687982c'
         '30f3c84b9064638f57af9b0609f56faf'
         'd380beb8def8d4f04a322c58db5128ed')



build() {
	patch -p2 < 001-paragon-ufsd-arch.patch
	patch -p1 < paragon-ufsd-3.15.patch

	cd ${srcdir}/
 
  	
}



package() {
	mkdir -p ${pkgdir}/usr/src/${_pkgname}-${pkgver}
	cp dkms.conf ${pkgdir}/usr/src/${_pkgname}-${pkgver}
	cp -RL ${srcdir}/* ${pkgdir}/usr/src/${_pkgname}-${pkgver}
}
