# Maintainer:  Víctor Quiroga <masterquiroga@ciencias.unam.mx>
pkgname=cagraph
pkgver=1.2
pkgrel=1
pkgdesc="A PyGTK widget for ploting charts and graphs using python, gtk and cairo"
arch=('any')
url="https://code.google.com/p/cagraph/"
license=('GPL3')
depends=('pygtk' 'python-cairo')
source=(https://cagraph.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
sha256sums=('a6928f07adb8f8d4b0076e01c0ec264e1acaaa6db21376c854fa827c9b04e3f3') #autofill using updpkgsums

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py build
}

package() { 
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py -q install --root="${pkgdir}" --optimize=1
}
