# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=("python-django-appconf" "python2-django-appconf")
pkgver="0.6"
pkgrel="1"
pkgdesc="A helper class for handling configuration defaults of packaged Django apps gracefully."
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/django-appconf"
license=("BSD")
makedepends=("python" "python-setuptools" "python2" "python2-setuptools")
source=("https://pypi.python.org/packages/source/d/django-appconf/django-appconf-$pkgver.tar.gz")
sha1sums=("e70f65cf9042ab9f62bc1d1a63cc3df6f7f5a9da")


build() {
  cp -r "$srcdir/django-appconf-$pkgver" "$srcdir/django-appconf-$pkgver-py2"

  cd "$srcdir/django-appconf-$pkgver"
  python setup.py build

  cd "$srcdir/django-appconf-$pkgver-py2"
  python2 setup.py build
}


package_python-django-appconf() {
  depends=("python-django")

  cd "$srcdir/django-appconf-$pkgver"
  python setup.py install --prefix="/usr" --root="$pkgdir"
}


package_python2-django-appconf() {
  depends=("python2-django")

  cd "$srcdir/django-appconf-$pkgver-py2"
  python2 setup.py install --prefix="/usr" --root="$pkgdir"
}

