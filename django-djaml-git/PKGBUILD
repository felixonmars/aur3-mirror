# Contributor: Andrew Grigorev <andrew@ei-grad.ru>
pkgname=django-djaml-git
pkgver=42.cad815f
pkgrel=1
pkgdesc="Django template loader that supports HamlPy"
arch=('any')
url="https://github.com/chartjes/djaml"
license=('MIT')
depends=('python2-django' 'django-hamlpy')
makedepends=('git')
provides=('django-djaml')
source=("git+git://github.com/chartjes/djaml.git")
md5sums=("SKIP")

pkgver() {
  cd $srcdir/djaml
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $srcdir/djaml
  python2 setup.py install --root=$pkgdir/
}
