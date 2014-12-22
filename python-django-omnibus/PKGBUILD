# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="python-django-omnibus"
pkgver="0.2.0"
pkgrel="2"
pkgdesc="A Django library which helps to create websocket-based connections between a browser and a server to deliver messages."
arch=("any")
url="https://pypi.python.org/pypi/django-omnibus"
license=("BSD")
depends=("python" "python-tornado" "python-pyzmq")
conflicts=("python-django-omnibus-git")
sha1sums=('0df919ddabe369c61424138a6b54c144c455b21a')
options=("!emptydirs")
source=(
  "http://pypi.python.org/packages/source/d/django-omnibus/django-omnibus-$pkgver.tar.gz"
  "fix-403-errors-from-tornado.patch")
sha1sums=(
  "710807bfcb0310fc0df74c0b6b1961f87e52c4f8"
  "4b5bdc276279827ad03c337e039efd2ee9817c0f")

prepare() {
  cd "$srcdir/django-omnibus-$pkgver"
  patch -p1 < "$srcdir/fix-403-errors-from-tornado.patch"
}

package() {
  cd "$srcdir/django-omnibus-$pkgver"
  /usr/bin/python3 setup.py install --root="$pkgdir/" --optimize=1
}
