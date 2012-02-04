# Contributor: dongfengweixiao ( dongfengweixiao [at] gmail [dot] com )
# Maintainer: dongfengweixiao ( dongfengweixiao [at] gmail [dot] com )

pkgname=ttf-microsoft-lisu
pkgver=3.01
pkgrel=1
pkgdesc="Microsoft LiSu fonts,Include Microsoft LiSu Regular style."
arch=('any')
license=('unknown')
url="http://www.microsoft.com"
depends=('fontconfig')
install=ttf-microsoft-lisu.install
source=('http://gthemes-china.googlecode.com/files/SIMLI.TTF.tar.gz')
md5sums=('6848cd03e199832edb8a294656150c4e')

build() {
  install -Dm644 ${srcdir}/SIMLI.TTF ${pkgdir}/usr/share/fonts/microsoft/SIMLI.TTF
}
