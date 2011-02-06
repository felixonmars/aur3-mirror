#Mantainer: Igor Nemilentsev <trezorg@gmail.com>
pkgname=python-googlemaps
pkgver=1.0.2
pkgrel=1
pkgdesc="Web widget creation toolkit based on TurboGears widgets"
arch=('i686' 'x86_64')
url="http://toscawidgets.org"
license=('MIT')
depends=('python2')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/g/googlemaps/googlemaps-${pkgver}.tar.gz")
md5sums=('90a7a0c876f8325ba5ae632e2fb193d2')
build() {
  cd ${srcdir}/googlemaps-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir}
  install -d ${pkgdir}/usr/share/licenses/$pkgname
  install -m 644 "$srcdir/googlemaps-${pkgver}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}
