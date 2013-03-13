# Maintainer: Alessandro Salmoiraghi <ale.salmo@gmail.com>
pkgname=mike
pkgver=0.2
pkgrel=2
pkgdesc="Mike is a time manager program that uses the Eisenhower method"
arch=('any')
url="http://sourceforge.net/projects/ike-python/"
license=('GPL')
depends=('gtk3' 'python>=3.2' 'python-gobject')
makedepends=()
optdepends=()
replaces=()
backup=()
options=()
source=(http://sourceforge.net/projects/ike-python/files/$pkgname-$pkgver.tar.gz)
md5sums=('aaf2c87788a0e418b7771ff1f1bcf06a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.glade "$pkgdir/usr/share/$pkgname/$pkgname.glade"
}
