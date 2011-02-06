# Contributor: Tom K <tom@archlinux.org>
# Maintainer: Heine Pedersen <nox@nox.dk>

pkgname=et131x
pkgver=1.2.3_3
pkgrel=2
pkgdesc="Agere ET131x ethernet driver, for kernel26"
depends=('kernel26')
source=(http://surfnet.dl.sourceforge.net/sourceforge/et131x/et131x-1.2.3-3.tar.gz
#	01_et131x-1.2.3-patch2.6.21.patch 
#	02_et131x-1.2.3-2.6.21.kmem.patch 
#	03_et131x-1.2.3-2.6.24_by_slh.patch 
#	04_et131x-1.2.3-2.6.23.kmem_cache_create.patch 
#	05_et131x-1.2.3-warning-unused-variable-fix.patch
	06_et131x-1.2.3-irq-timer-fix.patch
)

md5sums=('9496422c7d218f27bae1be42a04d122e'
#	'a18422b3e1dd42a547021988d6e82c84'
#	'03ed9e1e860e23f2f00704cd9d851189'
#	'd270f74cefef949283855885946697a8'
#	'e3fcb1d845825bc2af82ea4fed22933d'
#	'aee149acedb3e72a3e55ffba89a8a996'
	'4dbd30d6486807a4b8007aad268c7ec7'
)

url="http://sourceforge.net/projects/et131x/"
license="BSD"
arch=('i686')
install=et131x.install

_kernver=2.6.25-ARCH

build() {
  cd $startdir/src/et131x-1.2.3-3

#  patch -p1 < $startdir/01_et131x-1.2.3-patch2.6.21.patch || return 1
#  patch -p1 < $startdir/02_et131x-1.2.3-2.6.21.kmem.patch || return 1
#  patch -p1 < $startdir/03_et131x-1.2.3-2.6.24_by_slh.patch || return 1
#  patch -p1 < $startdir/04_et131x-1.2.3-2.6.23.kmem_cache_create.patch || return 1
#  patch -p1 < $startdir/05_et131x-1.2.3-warning-unused-variable-fix.patch || return 1
  patch -p1 < $startdir/06_et131x-1.2.3-irq-timer-fix.patch || return 1

  make KERNEL_VER=${_kernver} || return 1
  install -Dm755 et131x.ko $startdir/pkg/lib/modules/$_kernver/kernel/drivers/net/et131x.ko
  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" $startdir/et131x.install
}
