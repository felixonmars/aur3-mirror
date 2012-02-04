# Contributor: Viktor Semykin <thesame.ml@gmail.com>
pkgname=django-dev
pkgver=1.4alpha1
pkgrel=1
pkgdesc="Django framework development version."
arch=(any)
url="http://djangoproject.com"
license=(BSD)
groups=()
depends=(python2)
makedepends=()
provides=(django)
conflicts=(django)
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://www.djangoproject.com/m/releases/1.4/Django-1.4-alpha-1.tar.gz)
md5sums=(7a2e42bccb63f41a2c6931ddc36f46bf)

package() {
  cd "$srcdir/Django-1.4-alpha-1"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
