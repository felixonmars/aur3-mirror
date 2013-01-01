# Maintainer: Tarmo Heiskanen <turskii@gmail.com>
pkgname='dyfi-update'
pkgver=1.2.0
pkgrel=2
pkgdesc='Simple dynamic ip updater daemon for dy.fi'
arch=('any')
url='http://www.dy.fi/page/clients'
license=('GPL')
depends=('perl')
backup=('etc/dyfi-update.conf')
source=('dyfi-update.tmpfiles' 'dyfi-update.service' 'dyfi-update.conf' "http://www.dy.fi/files/dyfi-update-pl-${pkgver}.tar.gz")
install='dyfi-update.install'
md5sums=('3ceabf3bd2c23d3ae117721fabfa4b71'
         'ec5409e0581f0598b367bdffb803f259'
         '785c7e27473b637a55f8125db16cd11c'
         'e2d6d287a4993c033e5052f175d30ecf')

package() {
  cd "${srcdir}"
  install -D -m 644 dyfi-update.conf "${pkgdir}/etc/dyfi-update.conf"
  install -D -m 644 dyfi-update.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/dyfi-update.conf"
  install -D -m 644 dyfi-update.service "${pkgdir}/usr/lib/systemd/system/dyfi-update.service"
  cd "${srcdir}/dyfi-update-pl-${pkgver}"
  install -D -m 755 dyfi-update.pl "${pkgdir}/usr/bin/dyfi-update"
}

# vim:set ts=2 sw=2 et:
