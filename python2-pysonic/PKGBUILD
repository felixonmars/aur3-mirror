pkgname=python2-pysonic
_pkgpyname=py-sonic
pkgver=0.2.2
pkgrel=1
pkgdesc="Python wrapper library for the Subsonic REST API"
arch=('any')
url="https://github.com/crustymonkey/py-sonic"
license=('GPL3')
depends=('python2')
makedepends=('python2')
source=("https://pypi.python.org/packages/source/p/${_pkgpyname}/${_pkgpyname}-${pkgver}.tar.gz")
md5sums=('a475f3d22f0206bee0dc5c4db5d0f806')
sha512sums=('0749c228bee75a8881501367c5ced1462969c89fc2190db07fa0b09d9843650cf777403cae0215ed6286fed5a639728e04bd7f34492ca86b55a020a0bfa278d8')

package() {
  cd "$srcdir/$_pkgpyname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
