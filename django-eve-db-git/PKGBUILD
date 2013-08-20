# Contributor: Andrew Grigorev <andrew@ei-grad.ru>
pkgname=django-eve-db-git
pkgver=147.9373cb6
pkgrel=1
pkgdesc="Importers and ORM models for CCP's EVE Online data dump"
arch=('any')
url="https://github.com/gtaylor/django-eve-db"
license=('BSD')
depends=('python2-django')
makedepends=('git')
provides=('django-eve-db')
source=("git+git://github.com/gtaylor/django-eve-db.git")
md5sums=("SKIP")

pkgver() {
  cd $srcdir/django-eve-db
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $srcdir/django-eve-db
  python2 setup.py install --root=$pkgdir/
}
