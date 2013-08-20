# Contributor: Andrew Grigorev <andrew@ei-grad.ru>
pkgname=python2-hotqueue-git
pkgver=59.bcc5627
pkgrel=1
pkgdesc="Redis message queue"
arch=('any')
url="http://richardhenry.github.io/hotqueue/"
license=('MIT')
depends=('python2' 'python2-redis')
makedepends=('git')
provides=('python2-hotqueue')
source=("git+git://github.com/richardhenry/hotqueue.git")
md5sums=("SKIP")

pkgver() {
  cd $srcdir/hotqueue
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $srcdir/hotqueue
  python2 setup.py install --root=$pkgdir/
}
