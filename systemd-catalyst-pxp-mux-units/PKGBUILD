# Maintainer: NSL <nslqqq@gmail.com>

pkgname=systemd-catalyst-pxp-mux-units
pkgver=0.1
pkgrel=1
pkgdesc="Forces system to use radeon/intel or fglrx driver at startup. For MUXed A+I platforms."
arch=('any')
url="https://github.com/nslqqq/archlinux-packages/tree/master/systemd-catalyst-pxp-units"
license=('GPL')
depends=('systemd'
         'catalyst-total-pxp')
source=('catalyst_pxp'
        'catalyst_pxp.service'
        'catalyst_pxp.conf')

package() {
    install -Dm644 "${srcdir}/catalyst_pxp.service" "${pkgdir}/usr/lib/systemd/system/catalyst_pxp.service"
    install -Dm755 "${srcdir}/catalyst_pxp" "${pkgdir}/usr/bin/catalyst_pxp"
    install -Dm644 "${srcdir}/catalyst_pxp.conf" "${pkgdir}/etc/modprobe.d/catalyst_pxp.conf"
}

md5sums=('e208282887a16202263f8b1905ea7b39'
         '51024752454a246d1fac18cb67526457'
         'a9ee81885aba5356b094596f4f2f2440')
