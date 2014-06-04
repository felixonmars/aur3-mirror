# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="python2-django-websocket-redis"
pkgver="0.4.1"
pkgrel="1"
pkgdesc="Websockets for Django applications using Redis as message queue."
arch=("any")
url="http://django-websocket-redis.readthedocs.org/en/latest/index.html"
license=("MIT")
depends=("python2")
options=("!emptydirs")
source=("https://pypi.python.org/packages/source/d/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz")
sha1sums=("85d90bab3fd58259f07b3af3555622c7a6d60bc8")

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"
  /usr/bin/python2 setup.py install --root="$pkgdir/" --optimize=1
}
