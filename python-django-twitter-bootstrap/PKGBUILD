# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=("python-django-twitter-bootstrap" "python2-django-twitter-bootstrap")
pkgver="3.3.0"
pkgrel="1"
pkgdesc="Provides a Django app whose static folder contains Bootstrap assets."
arch=("any")
url="https://pypi.python.org/pypi/django-twitter-bootstrap"
license=("MIT")
makedepends=("python" "python-setuptools" "python2" "python2-setuptools")
source=("https://pypi.python.org/packages/source/d/django-twitter-bootstrap/django-twitter-bootstrap-$pkgver.tar.gz")
sha1sums=("e49f45179456e748b67715d59953922e9d654ab3")


build() {
  cp -r "$srcdir/django-twitter-bootstrap-$pkgver" "$srcdir/django-twitter-bootstrap-$pkgver-py2"

  cd "$srcdir/django-twitter-bootstrap-$pkgver"
  python setup.py build

  cd "$srcdir/django-twitter-bootstrap-$pkgver-py2"
  python2 setup.py build
}

package_python-django-twitter-bootstrap() {
  depends=("python-django")

  cd "$srcdir/django-twitter-bootstrap-$pkgver"
  python setup.py install --prefix="/usr" --root="$pkgdir"
}

package_python2-django-twitter-bootstrap() {
  depends=("python2-django")

  cd "$srcdir/django-twitter-bootstrap-$pkgver-py2"
  python2 setup.py install --prefix="/usr" --root="$pkgdir"
}
