# Contributor: Andrew Grigorev <andrew@ei-grad.ru>
pkgname=django-hamlpy-git
pkgver=335.fe3ba8b
pkgrel=1
pkgdesc="A converter of HAML like templates into Django templates"
arch=('any')
url="https://github.com/jessemiller/HamlPy"
license=('MIT')
depends=('python2-django')
makedepends=('git')
provides=('django-hamlpy')
source=("git+git://github.com/jessemiller/HamlPy.git")
md5sums=("SKIP")

pkgver() {
  cd $srcdir/HamlPy
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $srcdir/HamlPy
  python2 setup.py install --root=$pkgdir/
}
