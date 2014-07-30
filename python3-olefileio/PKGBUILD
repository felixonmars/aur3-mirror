# Contributor: Wes Brown <wesbrown18@gmail.com>
pkgname=python3-olefileio
pkgver=0.31
pkgrel=0
pkgdesc="Python 3 library to parse OLE files"
arch=('any')
url=("http://www.decalage.info/python/olefileio")
license=('MIT')
depends=('python3')
source=("https://bitbucket.org/decalage/olefileio_pl/downloads/OleFileIO_PL-${pkgver}.zip")
md5sums=('87c16645230c40f64d32e5cd125c2c55')

package() {
  cd "$srcdir/OleFileIO_PL-${pkgver}"
  python3 setup.py build install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -D -m644 README.txt "$pkgdir/usr/share/doc/$pkgname/README.txt"
  install -D -m644 README.html "$pkgdir/usr/share/doc/$pkgname/README.html"
}
