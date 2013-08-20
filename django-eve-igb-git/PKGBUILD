# Contributor: Andrew Grigorev <andrew@ei-grad.ru>
pkgname=django-eve-igb-git
pkgver=19.3634910
pkgrel=1
pkgdesc="Simple to use Django wrapper around the HTTP headers that are send by EVE Online ingame browser (IGB)."
arch=('any')
url="https://github.com/jenslauterbach/django-eve-igb"
license=('BSD')
depends=('python2-django')
makedepends=('git')
provides=('django-eve-igb')
source=("git+git://github.com/jenslauterbach/django-eve-igb.git")
md5sums=("SKIP")

pkgver() {
  cd $srcdir/django-eve-igb
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $srcdir/django-eve-igb
  python2 setup.py install --root=$pkgdir/
}
