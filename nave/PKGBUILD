# Maintainer: Roy Lines <roy@roylines.co.uk>

pkgname=nave
pkgver=0.4.3
pkgrel=2
pkgdesc="Virtual Environments for Node"
arch=('any')

url="https://github.com/isaacs/nave"
license=('BSD')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/isaacs/${pkgname}/tarball/v${pkgver}")

md5sums=('5535e44b90b6d010309dfe7700d0b1fb')

build() {
	tar -xvzf ${pkgname}-${pkgver}.tar.gz
}

package() {
  cd "${srcdir}/isaacs-nave-5967017"
  install -Dm755 nave.sh "${pkgdir}/usr/bin/nave"
}
