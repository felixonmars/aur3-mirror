# Maintainer: ava1ar <mail(dot)avatar(at)gmail(dot)com>

pkgname=novacom-systemd
pkgver=0.1
pkgrel=2
pkgdesc="Systemd unit file for Novacom service (webOS development connectivity)"
arch=('any')
url="https://developer.palm.com/"
license=('GPL')
depends=('systemd')
install=novacom-systemd.install
source=('novacom.service' 'novacomd')
sha256sums=('a466531da253d79b2399ff51e8f5c9e05af4d640f0552bfd32a2d41e67039b2d'
	'd4f62f7e750942aa2141631c4a23ec4aac9588705385a6df290778688d343191')

package() {
  install -m 755 -D "${srcdir}/novacomd" "${pkgdir}/usr/bin/novacomd"
  install -m 644 -D "${srcdir}/novacom.service" "${pkgdir}/lib/systemd/system/novacom.service"
}
