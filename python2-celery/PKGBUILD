# Maintainer: Xeross <contact@xeross.me>
# Previous Maintainer: Tevin Zhang <mail2tevin {at} gmail {dot} com>
# Contributor: Stefan Seemayer

pkgname=python2-celery
pkgver=3.1.13
pkgrel=1
pkgdesc="Distributed Task Queue"
arch=("any")
url="http://celeryproject.org/"
license=("BSD")
depends=("python2" "python2-kombu>=3.0.7" "python2-dateutil" "python2-billiard>=3.3.0.10" "python2-amqp>=1.3.3" "python2-pytz>=2013.8-1")
makedepends=("python2-distribute")
source=("http://pypi.python.org/packages/source/c/celery/celery-${pkgver}.tar.gz")
sha512sums=('0391e330c0d5f819d856794940b50f3dc4637421a01b7fec2a4a2d5ca4c90b57615bc6d2244165b915164f80ebc4b919dafa469de05dab5cc2ab19c955e01afe')

build() {
  cd celery-$pkgver
  python2 setup.py build
}

package() {
  cd celery-$pkgver

  python2 setup.py install --root="${pkgdir}" --optimize=1

  install -D "extra/generic-init.d/celeryd" "${pkgdir}/etc/rc.d/celeryd"
  install -D "extra/generic-init.d/celerybeat" "${pkgdir}/etc/rc.d/celerybeat"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
