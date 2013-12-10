# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=rosa-elementary-theme
pkgver=2.6.1
_pkgver=2.6.1-4-rosa2012.1
pkgrel=1
pkgdesc="ROSA-elementary theme"
arch=('any')
url="http://rosalab.ru/"
license=('GPL2')
depends=('gtk-aurora-engine' 'gtk-engine-murrine')
optdepends=('rosa-icons')
groups=('kde')
source=("http://abf-downloads.rosalinux.ru/rosa2012.1/repository/i586/main/testing/${pkgname}-${_pkgver}.noarch.rpm")
sha256sums=('99fdfdd319754a59617182709f811577259985b91dfd3f6c8fe6859c65386530')

package() {
  cd "$srcdir"
  
  cp -R ./usr "$pkgdir"
}
