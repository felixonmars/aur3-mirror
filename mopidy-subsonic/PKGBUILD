pkgname=mopidy-subsonic
_pkgpyname=Mopidy-Subsonic
pkgver=0.3.1
pkgrel=1
pkgdesc="Mopidy extension for playing music from Subsonic"
arch=('any')
url="https://github.com/rattboi/mopidy-subsonic"
license=('MIT')
depends=('python2' 'python2-setuptools' 'python2-pykka>=1.1' 'python2-pysonic' 'mopidy>=0.18')
makedepends=('python2')
source=("https://pypi.python.org/packages/source/M/${_pkgpyname}/${_pkgpyname}-${pkgver}.tar.gz")
md5sums=('70cd4a5c554f63f1975a707de59a79cf')
sha512sums=('bd4bf4fc43fa69fb420f94a02a7d67d34f56121fa5b8a751e226f00bf4c839102434006a24a35ec32c96928e70e03219f294f291a68111ce304e18108ef32c72')

package() {
  cd "$srcdir/$_pkgpyname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
