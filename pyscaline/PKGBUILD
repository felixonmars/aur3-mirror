# Maintainer: Alessandro Salmoiraghi <ale.salmo@gmail.com>
pkgname=pyscaline
pkgver=0.1
pkgrel=2
pkgdesc="A simple calculator written in python 3.3.0 and GTK+"
arch=('any')
url="https://sourceforge.net/projects/pyscaline/"
license=('GPL')
depends=('gtk3' 'python>=3.2' 'python-gobject')
makedepends=()
optdepends=()
replaces=()
backup=()
options=()
#install=pyscaline.install
source=(http://sourceforge.net/projects/pyscaline/files/$pkgname-$pkgver.tar.gz)
md5sums=('d32bac073c61fd2fc1ccf8a95749c34a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.glade "$pkgdir/usr/share/$pkgname/$pkgname.glade"
}
