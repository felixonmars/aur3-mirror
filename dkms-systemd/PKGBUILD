# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=dkms-systemd
pkgver=1.0
pkgrel=2
pkgdesc='DKMS service for systemd'
arch=('any')
url='https://i.made.this/myself'
license=('GPL')
depends=('glibc' 'dkms')
source=('dkms.systemd'
        'dkms.wrapper')
sha512sums=('442945971d94ccf9df5c8619ecf95bad0717e8c68b072f1ce7011d5d975a3248d75431e37143a4aa12d237a497db145178765c7d0ea0117b197c3214d2087b75'
            '622e9843eff3771ee78d12a23e4d3a4da6ee77ec170f048de20ae973ab6960a0b6ed5108109c38ebdb018dbfaca23489214e24a3734779942f862257350af487')

package() {
  cd "${srcdir}"

  install -Dm755 "${srcdir}/dkms.wrapper" "${pkgdir}/usr/sbin/dkms_wrapper"
  install -Dm644 "${srcdir}/dkms.systemd" "${pkgdir}/usr/lib/systemd/system/dkms.service"
}
