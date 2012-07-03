# Maintainer: skatiger <skatiger at gmail dot com>
pkgname=systemd-nexus-units
pkgver=1.0
pkgrel=4
pkgdesc="Nexus service for systemd"
arch=('any')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL')
depends=('nexus' 'systemd')
install=$pkgname.install
source=('nexus.service'
'nexus.conf'
'nexus'
'systemd-nexus-units.install')
backup=('etc/conf.d/nexus')
package() {
    install -Dm644 "${srcdir}/nexus.service" "${pkgdir}/usr/lib/systemd/system/nexus.service"
    install -Dm644 "${srcdir}/nexus.conf" "${pkgdir}/etc/tmpfiles.d/nexus.conf"
    install -Dm644 "${srcdir}/nexus" "${pkgdir}/etc/conf.d/nexus"
}



md5sums=('db63135e69c4fb9d0a880936a8c7d96b'
'245d7d2855d7b2ff92c280f5adb9643a'
'ee85f2e97426704e8fe6248d9e482922'
'47d6d16f0d7103986f36fa144f1f4074')
