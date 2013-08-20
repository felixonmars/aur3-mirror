# Contributor: Andrew Grigorev <andrew@ei-grad.ru>
pkgname=django-cache-machine-git
pkgver=109.ace04f8
pkgrel=2
pkgdesc="Automatic caching and invalidation for Django models through the ORM"
arch=('any')
url="https://github.com/jbalogh/django-cache-machine"
license=('BSD')
depends=('python2-django')
makedepends=('git')
provides=('django-cache-machine')
source=("git+git://github.com/jbalogh/django-cache-machine.git")
md5sums=("SKIP")

pkgver() {
  cd $srcdir/django-cache-machine
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $srcdir/django-cache-machine
  python2 setup.py install --root=$pkgdir/
}
