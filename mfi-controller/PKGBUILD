# Maintainer: Adam Eberlin <ae at adameberlin dot com>
# Contributor: Adam Eberlin <ae at adameberlin dot com>

pkgname=mfi-controller
pkgver=2.1.11
pkgrel=1
pkgdesc='Controller for Ubiquiti mFi sensors and gateways'
arch=('any')
url='http://www.ubnt.com/'
license=('custom')
depends=('mongodb2.4' 'java-runtime' 'unzip')
conflicts=('mfi-git')
backup=('opt/mfi/data/system.properties')
install=mfi.install
source=("mFi-$pkgver.zip::http://dl.ubnt.com/mfi/$pkgver/mFi.unix.zip"
        'mfi.service')
md5sums=('12603c0490018fccc1d6c28a1b781475'
         '7b5f6c3cfcebc45f5ed9bf4d92002660')

package() {
  install -d "$pkgdir/opt"
  cp -ar mFi "$pkgdir/opt/mfi"
  chown -R 114:114 "$pkgdir/opt/mfi"
  install -D -m 644 mfi.service "$pkgdir/usr/lib/systemd/system/mfi.service"
}
