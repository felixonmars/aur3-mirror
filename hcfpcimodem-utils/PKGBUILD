# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=hcfpcimodem-utils
pkgver=1.20full
pkgrel=1
pkgdesc="Linux drivers for the Conexant HCF Softmodem family (userspace tools and libraries)"
arch=('i686')
url="http://www.linuxant.com/drivers/hcf/"
license=('GPL' 'custom')
install=hcfpcimodem-utils.install
depends=('perl' 'cpio')
source=(http://www.linuxant.com/drivers/hcf/full/archive/hcfpcimodem-${pkgver}/hcfpcimodem-${pkgver}.tar.gz)
md5sums=('808b7b879a513205485ec7c903f1a35d')

build() {
  cd "${srcdir}/hcfpcimodem-${pkgver}"

  make PREFIX="${pkgdir}/usr" ROOT="${pkgdir}" install || return 1
  echo "TAR hcfpcimodem-${pkgver}" > ${pkgdir}/etc/hcfpcimodem/package

  # Fix paths in scripts
  sed -e "s|$pkgdir/usr/sbin:||" -e "s|$pkgdir||g" -i $pkgdir/usr/sbin/hcfpci{config,modconflicts,stop}

  # Install license for non-GPL'ed components
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || return 1
}
