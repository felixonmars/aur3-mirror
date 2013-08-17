pkgname=lewm
pkgver=0.9.37
pkgrel=1
pkgdesc="commandline get keepassx password"
url="http://github.com/cdede/lewm/"
arch=('any')
license=('GPL3')
depends=('python-kppy' )
source=(https://github.com/cdede/lewm/tarball/${pkgver})
sha256sums=('b56bc3cca9d3ab7e895da365db1a6338cb1567462ffc184f472c304bc26018a5')

build() {
  cd  ${srcdir}/*${pkgname}*/
  python  setup.py build
}
package() {
  cd  ${srcdir}/*${pkgname}*/
  python setup.py install --root="$pkgdir/" --optimize=1
}
