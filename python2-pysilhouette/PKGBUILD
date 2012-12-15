# Maintainer: irgaly <irgaly@gmail.com>
pkgname=python2-pysilhouette
pkgver=0.7.0
pkgrel=2
pkgdesc="Pysilhouette is a python daemon which executes background job commands queued in database."
arch=(any)
url="http://pysilhouette.sourceforge.jp/"
license=('MIT')
groups=()
depends=('python2' 'python2-sqlalchemy')
makedepends=('python2-distribute')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://sourceforge.jp/frs/redir.php?f=/pysilhouette/48282/pysilhouette-0.7.0.tar.gz")
md5sums=('a88f9d23363baed53aeb3c57520ebe70')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build || return -1
  python2 setup.py install --root="$pkgdir/" --optimize=1 || return -1
}
