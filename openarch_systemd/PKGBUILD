# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=openarch_systemd
pkgver=0.1
pkgrel=7
pkgdesc="systemd configurations files for OpenArch"
arch=('any')
url="http://ovsinc.narod.ru/"
license=('GPL')
depends=('systemd' 'systemd-arch-units')
source=('openarch_systemd.tar.gz')


build() {
	cp -R "${srcdir}"/systemd/* "${pkgdir}"/
}

md5sums=('e6b12da5241cd2d1ab94302d66c81419')
