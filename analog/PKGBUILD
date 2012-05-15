# Contributor: Sven Kauber <celeon@gmail.com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=analog
pkgver=6.0
pkgrel=3
arch=('i686' 'x86_64')
license=('GPL2')
pkgdesc="A program which analyses logfiles from WWW servers"
url="http://www.analog.cx/"
depends=('perl')
install=analog.install
source=(http://www.analog.cx/${pkgname}-${pkgver}.tar.gz)
md5sums=('743d03a16eb8c8488205ae63cdb671cd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "${pkgdir}/opt/analog"
  cp -Rx * ${pkgdir}/opt/analog/
}
