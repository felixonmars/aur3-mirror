# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="python-flower"
pkgver="0.7.0"
pkgrel="1"
pkgdesc="A web based tool for monitoring and administrating Celery clusters."
arch=("any")
url="http://github.com/celery/py-amqp"
license=("BSD")
depends=("python")
options=("!emptydirs")
source=("https://pypi.python.org/packages/source/f/flower/flower-$pkgver.tar.gz")
sha1sums=("c7169b772ab3cbb9713fc02c0427a81c478a25f6")

package() {
  cd "$srcdir/flower-$pkgver"
  /usr/bin/python3 setup.py install --root="$pkgdir" --optimize=1
}
