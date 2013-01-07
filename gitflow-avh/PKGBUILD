# Contributor: Stefan Tatschner <stefan.tatschner@gmail.com>

_pkgname=gitflow
pkgname=gitflow-avh
pkgver=1.3.1
pkgrel=2
pkgdesc="Extend git with Vincent Driessen's branching model. The AVH Edition adds more functionality to the existing git-flow."
arch=('any')
url='https://github.com/petervanderdoes/gitflow/'
license=('BSD', 'LGPL')
depends=('git')
source=("https://github.com/petervanderdoes/gitflow/archive/${pkgver}.tar.gz")
md5sums=('c4ac5f984f7dfdb9f4c388750d16d910')
changelog="changelog"

package(){
   cd "$srcdir/$_pkgname-$pkgver"
   make prefix="$pkgdir/usr" install
}
