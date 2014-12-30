# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=("python-django-jquery" "python2-django-jquery")
pkgver="1.9.1"
pkgrel="1"
pkgdesc="jQuery packaged in an handy django app to speed up new applications and deployment."
arch=("any")
url="https://pypi.python.org/pypi/django-jquery"
license=("MIT")
makedepends=("python" "python-setuptools" "python2" "python2-setuptools")
source=("https://pypi.python.org/packages/source/d/django-jquery/django-jquery-$pkgver.tar.gz")
md5sums=("6e61e1a0205fd7acb3b4f75e26898535")


build() {
  cp -r "$srcdir/django-jquery-$pkgver" "$srcdir/django-jquery-$pkgver-py2"

  cd "$srcdir/django-jquery-$pkgver"
  python setup.py build

  cd "$srcdir/django-jquery-$pkgver-py2"
  python2 setup.py build
}


package_python-django-jquery() {
  depends=("python-django")

  cd "$srcdir/django-jquery-$pkgver"
  python setup.py install --prefix="/usr" --root="$pkgdir"
}


package_python2-django-jquery() {
  depends=("python2-django")

  cd "$srcdir/django-jquery-$pkgver-py2"
  python2 setup.py install --prefix="/usr" --root="$pkgdir"
}
