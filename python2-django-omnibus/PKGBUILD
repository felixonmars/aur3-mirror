# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="python2-django-omnibus"
pkgver="0.1.0"
pkgrel="1"
pkgdesc="A Django library which helps to create websocket-based connections between a browser and a server to deliver messages."
arch=("any")
url="https://pypi.python.org/pypi/django-omnibus"
license=("BSD")
depends=("python2" "python2-tornado" "python2-pyzmq")
sha1sums=('0df919ddabe369c61424138a6b54c144c455b21a')
options=("!emptydirs")
source=("http://pypi.python.org/packages/source/d/django-omnibus/django-omnibus-$pkgver.tar.gz")
sha1sums=("0df919ddabe369c61424138a6b54c144c455b21a")

package() {
  cd "$srcdir/django-omnibus-$pkgver"
  /usr/bin/python2 setup.py install --root="$pkgdir/" --optimize=1
}
