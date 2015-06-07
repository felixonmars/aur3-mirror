# Maintainer: Brandon Mulcahy <brandon@jangler.info>
pkgname=labrat
pkgver=0.1.1
pkgrel=1
pkgdesc="CIELAB color picker"
arch=('any')
url="http://jangler.info/code/labrat"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://github.com/jangler/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('9cc5dd5dbed4fbd5b50be67828b26c7bbd799411d55a16fdb3d4e4f31fb4d6c7')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
