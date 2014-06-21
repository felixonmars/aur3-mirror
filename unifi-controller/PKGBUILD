# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Sébastien Luttringer

pkgname=unifi-controller
pkgver=3.2.1
pkgrel=2
pkgdesc='Controller for Ubiquiti UniFi accesspoints'
arch=('any')
url='http://www.ubnt.com/'
license=('custom')
depends=('mongodb' 'jdk7-compat')
conflicts=('unifi-controller-beta' 'tomcat-native')
# needed to not break configuration accross upgrades
backup=('opt/unifi/data/system.properties')
install=unifi.install
source=("UniFi-$pkgver.zip::http://dl.ubnt.com/unifi/$pkgver/UniFi.unix.zip"
        'unifi.service')
md5sums=('9b2d59e6be25db2210f4d85512315e6f'
         'c88ef3a0490276cf553417ed1f74ec0d')

package() {
  install -d "$pkgdir/opt"
  cp -ar UniFi "$pkgdir/opt/unifi"
  chown -R 113:113 "$pkgdir/opt/unifi"
  rm "$pkgdir/opt/unifi/readme.txt"
  install -D -m 644 unifi.service "$pkgdir/usr/lib/systemd/system/unifi.service"
}
