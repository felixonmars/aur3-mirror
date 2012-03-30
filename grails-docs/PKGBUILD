# Maintainer: Denis A. Altoé Falqueto <denisfalqueto@gmail.com>
pkgname=grails-docs
pkgver=2.0.2
pkgrel=1
pkgdesc="Documentation files for Grails"
arch=('any')
url="http://grails.org"
license=('Apache')
depends=("grails>=$pkgver")
options=(!strip docs)
source=(http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/$pkgname-$pkgver.zip)
noextract=($pkgname-$pkgver.zip)
md5sums=('d1ee71d7d6e0c5dab545e74bebe5188c')

build() {
  msg "Nothing to build..."
}

package() {
  cd "$srcdir"

  mkdir -p "$pkgdir/usr/share/grails/doc"
  unzip $pkgname-$pkgver.zip -d "$pkgdir/usr/share/grails/doc"
}

# vim:set ts=2 sw=2 et:
