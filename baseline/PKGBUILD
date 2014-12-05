# Maintainer: Mohamed Aslan <maslan@sce.carleton.ca>

pkgname=baseline
pkgver=04122014
pkgrel=1
pkgdesc="Yet another opensource distributed versioning control system"
arch=('i686' 'x86_64')
url="http://www.sce.carleton.ca/~maslan/baseline/"
#source=(http://www.sce.carleton.ca/~maslan/$pkgname/${pkgname}_$pkgver.tar.gz)
source=(http://www.sce.carleton.ca/~maslan/$pkgname/${pkgname}-p.tar.gz)
sha256sums=('5c5badc38ab29536c75d618737465e05c29b12be3408154e5d6b7bc908a3a482')
license=('ISC')

build() {
  #cd ${pkgname}_$pkgver
  cd ${pkgname}-p
  make || return 1
}

package() {
  cd ${pkgname}-p
  mkdir -p "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir"/usr/share/man/man1/
  install -m755 baseline "$pkgdir"/usr/bin/
  install -m644 baseline.1 "$pkgdir"/usr/share/man/man1/
}

