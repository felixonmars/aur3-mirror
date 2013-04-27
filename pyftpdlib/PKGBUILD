# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Stephane Travostino <stephane.travostino@gmail.com>

pkgname=pyftpdlib
pkgver=1.2.0
pkgrel=1
pkgdesc="Complete asynchronous FTP server library in Python"
arch=('any')
url='http://pyftpdlib.googlecode.com'
license=('MIT')
depends=('python2')
optdepends=("python2-sendfile: used to speedup transfers")
source=("http://pyftpdlib.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('65f2b2cea84d9110fe929ef38db79dbb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
# vim:set ts=2 sw=2 et:
