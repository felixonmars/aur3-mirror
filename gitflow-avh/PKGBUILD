# Contributor: Stefan Tatschner <stefan.tatschner@gmail.com>
# Maintainer: Stefan Tatschner <stefan.tatschner@gmail.com>

_pkgname=gitflow
pkgname=gitflow-avh
pkgver=1.5.0
pkgrel=1
pkgdesc="Extend git with Vincent Driessen's branching model. The AVH Edition adds more functionality to the existing git-flow."
arch=('any')
url='https://github.com/petervanderdoes/gitflow/'
license=('BSD', 'LGPL')
depends=('git')
source=("https://github.com/petervanderdoes/gitflow/archive/${pkgver}.tar.gz")
md5sums=('aa02186e1798c66986c9bc832329f80b')
changelog="changelog"

package(){
   cd "$srcdir/$_pkgname-$pkgver"
   make prefix="$pkgdir/usr" install
}
