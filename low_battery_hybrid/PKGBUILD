# Maintainer: Serede Sixty Six <serede.dev@gmail.com>

pkgname=low_battery_hybrid
pkgver=1.0
pkgrel=1
pkgdesc="Simple bash script to hybrid-sleep the system based on udev power_supply subsystem. Based on NickHu's low_battery_suspend."
arch=('any')
url="https://github.com/Serede/low_battery_hybrid/releases"
license=('MIT')
depends=('bash' 'systemd' 'coreutils')
source=("https://github.com/Serede/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('f0c2b120bea54e5bad7728bf24d3336e')

package()
{
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/lib/systemd/system
  install -m 755 ${srcdir}/${pkgname}-${pkgver}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -m 644 -t ${pkgdir}/usr/lib/systemd/system ${srcdir}/${pkgname}-${pkgver}/systemd/*
}
