_pkgname=argparse
pkgname=python26-$_pkgname
pkgver=1.2.1
pkgrel=1
pkgdesc="Python command-line parsing library"
arch=('any')
url="http://code.google.com/p/argparse/"
license=('Python Software Foundation License')
groups=()
depends=('python26')
makedepends=('python26-distribute')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=(http://argparse.googlecode.com/files/argparse-1.2.1.tar.gz)
md5sums=('2fbef8cb61e506c706957ab6e135840c')
sha256sums=('ddaf4b0a618335a32b6664d4ae038a1de8fbada3b25033f9021510ed2b3941a4')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2.6 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
