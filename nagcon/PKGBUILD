# Contributor: Jan Fader <jan.fader@web.de>
pkgname=nagcon
pkgver=0.0.30
pkgrel=1
pkgdesc="nagcon - console interface for nagios"
url="http://www.vanheusden.com/nagcon"
license=('GPL')
depends=('gcc-libs')
source=(http://www.vanheusden.com/$pkgname/$pkgname-$pkgver.tgz)
arch=('i686')
md5sums=('0b3e8c1c9e015dfd108bdbc4e8b65c52')

build() {
  cd $startdir/src/$pkgname-$pkgver/
  make || return 1
  install -D  nagcon $pkgdir/usr/bin/nagcon
}
