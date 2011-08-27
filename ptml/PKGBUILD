# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=ptml
pkgver=0.4.0
pkgrel=1
pkgdesc="A Python module that lets a user embed Python code in documents"
arch=('i686' 'x86_64')
url="http://www.sourceforge.net/projects/ptml"
license=('BSD')
depends=('python')
makedepends=()
source=("http://downloads.sourceforge.net/$pkgname/PTML/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('d4b5e0ac59b51dd1e2abdc87020b18d0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py build

}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root=$pkgdir
 
  install -Dm644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}


# vim:set ts=2 sw=2 et:
