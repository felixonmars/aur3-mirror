# Contributor Jan Willemson <janwil@hot.ee>
pkgname=xeukleides
pkgver=1.0.1
pkgrel=1
pkgdesc="XEukleides -- a frontent for Eukleides"
url="http://perso.wanadoo.fr/obrecht/"
license=""
makedepends=()
depends=('gtk' 'x-server')
source=(http://perso.wanadoo.fr/obrecht/download/$pkgname.$pkgver.tar.gz)
md5sums=('66d37a4f34a8f9cc82e1edb562fb5b6c')

build() {
  cd $startdir/src/$pkgname.$pkgver
  make || return 1
  make PREFIX=$startdir/pkg/usr install
}
