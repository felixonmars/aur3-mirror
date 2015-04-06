# Contributor: palkeo <contact at palkeo.com>

pkgname=("python-django-formtools" "python2-django-formtools")
pkgver="1.0"
pkgrel="1"
pkgdesc="A set of high-level abstractions for Django forms"
arch=("any")
url="https://pypi.python.org/pypi/django-formtools"
license=("BSD")
makedepends=("python" "python-setuptools" "python2" "python2-setuptools")
source=("https://pypi.python.org/packages/source/d/django-formtools/django-formtools-$pkgver.tar.gz")
sha1sums=("840ee7a79af1c56b385ec32d48cd01aa10650c27")


build() {
  cp -r "$srcdir/django-formtools-$pkgver" "$srcdir/django-formtools-$pkgver-py2"

  cd "$srcdir/django-formtools-$pkgver"
  python setup.py build

  cd "$srcdir/django-formtools-$pkgver-py2"
  python2 setup.py build
}


package_python-django-formtools() {
  depends=("python-django")

  cd "$srcdir/django-formtools-$pkgver"
  python setup.py install --prefix="/usr" --root="$pkgdir"
}


package_python2-django-formtools() {
  depends=("python2-django")

  cd "$srcdir/django-formtools-$pkgver-py2"
  python2 setup.py install --prefix="/usr" --root="$pkgdir"
}


