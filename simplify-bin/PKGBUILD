
# Contributor: Paolo Herms

pkgname=simplify-bin
pkgver=1.5.4
pkgrel=1
pkgdesc="An automatic theorem prover"
arch=('any')
url="http://kind.ucd.ie/products/opensource/archives/"
license=('unknown')
makedepends=('unzip')
source=(http://krakatoa.lri.fr/ws/Simplify-1.5.5-13-06-07-binary.zip)
md5sums=('cacbd98e7cff7b81e43427420b7daf45')

build() {
  install -D "$srcdir"/Simplify/Simplify-1.5.4.linux "$pkgdir"/usr/bin/simplify
}
