# Contributor: Wes Brown <wesbrown18@gmail.com>
# TODO: pkgbase=python-olefile
pkgname=python3-olefileio
pkgver=0.40
pkgrel=0
pkgdesc='Python 3 library to read and write OLE files (now called "olefile")'
arch=('any')
url=("http://www.decalage.info/python/olefileio")
license=('MIT')
depends=('python3')
source=("https://bitbucket.org/decalage/olefileio_pl/downloads/olefile-${pkgver}.zip")
md5sums=('d9d909e6a09a8b0b2f60996e7d4783c0')

package() {
  cd "$srcdir/olefile-${pkgver}"
  python3 setup.py build install --root="${pkgdir}" --optimize=1
  
  LICENSES="$pkgdir/usr/share/licenses/$pkgname"
  install -d "$LICENSES/"
  PACKAGES="$(python3 -c '
import sys, os.path
print(os.path.join(
  "lib", "python{}.{}".format(*sys.version_info), "site-packages",
))')"
  ln -s "../../../$PACKAGES/olefile/LICENSE.txt" "$LICENSES/"
}
