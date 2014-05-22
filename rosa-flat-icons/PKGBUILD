# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: 

pkgname=rosa-flat-icons
pkgver=0.0.2
_pkgver=0.0.2-1-rosa2014.1
pkgrel=1
pkgdesc="ROSA icons theme."
arch=('any')
url="http://www.rosalinux.com"
license=('GPL')
depends=('gnome-icon-theme')
source=("http://abf-downloads.rosalinux.ru/rosa2014.1/repository/i586/main/release/$pkgname-${_pkgver}.noarch.rpm")
sha256sums=('e8d861d34775a02ec02ad4c82c79cf5157566abea4ee4a81d9f10d9b3408a48e')

package() {
  cd "$srcdir"
  cp -R usr "$pkgdir"
}
