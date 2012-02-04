# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=hcfpcimodem
pkgver=1.20full
pkgrel=1
pkgdesc="Linux drivers for the Conexant HCF Softmodem family (kernel modules)"
arch=('i686')
url="http://www.linuxant.com/drivers/hcf/"
license=('GPL' 'custom')
depends=("hcfpcimodem-utils>=$pkgver" 'kernel26>=2.6.32.3' 'kernel26<2.6.33')
makedepends=('kernel26-headers>=2.6.32' 'kernel26-headers<2.6.33')
install=hcfpcimodem.install
source=(http://www.linuxant.com/drivers/hcf/full/archive/hcfpcimodem-${pkgver}/hcfpcimodem-${pkgver}.tar.gz)
md5sums=('808b7b879a513205485ec7c903f1a35d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/modules"

  make CNXT_MODS_DIR=$pkgdir/lib/modules/$(uname -r)/extra modules_install || return 1
  make CNXTLIBDIR=$pkgdir/usr/lib/hcfpcimodem CNXT_MODS_DIR=$pkgdir/lib/modules/$(uname -r)/extra modules_install

  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/hcfpcimodem.install
}
