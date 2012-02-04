pkgname=python2-solartz
_pkgname=SolarTZ
pkgver=0.1
pkgrel=1
pkgdesc="Time zone for the solar time"
arch=(any)
url="http://pypi.python.org/pypi/SolarTZ"
license=('Apache-2.0')
depends=('python2')
optdepends=('python2-pytz: for timezone translations')
source=(http://pypi.python.org/packages/source/S/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('070348270a7be95acbbeca54a32ce563')

build() {
  cd $srcdir/${_pkgname}-${pkgver}
  python2 setup.py install --root=$pkgdir/  --optimize=1
# install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
