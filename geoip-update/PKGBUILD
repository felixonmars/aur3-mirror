# Contributor: <fedoseev2004@yahoo.com>
pkgname=geoip-update
pkgver=0.1
pkgrel=1
pkgdesc="weekly update database for Non-DNS IP-to-country resolver"
arch=(i686 x86_64)
license=('GPL')
url="http://arch.yu.wildpark.net"
depends=('geoip' 'wget' 'gzip' 'cron')
source=(${pkgname}.sh)
md5sums=('f2c36173a939fa24bbc1bb4535993f3d')

build() {
  mkdir -p -m0755 ${pkgdir}/etc/cron.weekly
  install -m0744 ${pkgname}.sh ${pkgdir}/etc/cron.weekly/${pkgname}.sh
}

