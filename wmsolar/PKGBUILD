# Contributor: <predrg@gmail.com>

pkgname=wmsolar
pkgver=1.0
pkgrel=1
pkgdesc="Shows you the solar system viewed from top (90° heliocentric)."
arch=('i686' 'x86_64')
url="http://www.inxsoft.net/wmsolar/"
license=('Freeware, PD, no warranty')
groups=()
depends=('libx11')
source=(http://www.inxsoft.net/wmsolar/$pkgname-$pkgver.tar.gz 
        commit-f0b9845)
md5sums=('f5d1aabcb2e4510e0d551ff66f59ffac'
         'fa756ea74e873755596a254cc855a1f2')

build() {
  cd "$srcdir"/wmSolar
  patch -p1 < ../commit-*
  make
}

package() {
  cd "$srcdir"/wmSolar
  install -D -m755 wmSolar "$pkgdir"/usr/bin/wmSolar
}
