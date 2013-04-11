# Contributor: Francois Boulogne <fboulogne@april.org>
# Maintainer: Francois Boulogne <fboulogne@april.org>

pkgname=acidrain
pkgver=0.4.1
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="Synchronize files between computers and keep a history of changes in them"
url="http://myacidrain.com"
license=("GPL3")
depends=()
makedepends=()
source=("http://myacidrain.com/sites/www.myacidrain.com/files/${pkgname}-${pkgver}.tgz")
md5sums=('73f2f03ede201388b2a304116f2c2604')

build() {
  cd "${pkgname}-${pkgver}"
  qmake-qt4
  make
  make install INSTALL_ROOT=%"${pkgdir}"
}
# vim:ts=2:sw=2:et:
