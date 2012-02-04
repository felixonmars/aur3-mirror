# Contributor: dongfengweixiao ( dongfengweixiao [at] gmail [dot] com )
# Maintainer: dongfengweixiao ( dongfengweixiao [at] gmail [dot] com )

pkgname=ttf-microsoft-youyuan
pkgver=3.01
pkgrel=1
pkgdesc="Include YouYuan Regular style."
arch=('any')
license=('unknown')
url="http://www.microsoft.com"
depends=('fontconfig')
install=ttf-microsoft-youyuan.install
source=('http://gthemes-china.googlecode.com/files/SIMYOU.tar.gz')
md5sums=('e0e82d9f1b03611fb163188b2c36192b')

build() {
  install -Dm644 ${srcdir}/SIMYOU.TTF ${pkgdir}/usr/share/fonts/microsoft/SIMYOU.TTF
}
