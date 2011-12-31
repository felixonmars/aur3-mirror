# Maintainer: Victor van den Elzen <victor.vde@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: sujith_m82 <m.sujith@gmail.com>

pkgname=vm
pkgver=8.2.0b
pkgrel=1
pkgdesc="View Mail for Emacs"
arch=('i686' 'x86_64')
url="https://launchpad.net/vm"
license=('GPL')
options=('docs')
depends=('emacs')
optdepends=('bbdb: for using a rolodex-like db')
install='vm.install'
source=("http://launchpad.net/vm/8.2.x/$pkgver/+download/vm-$pkgver.tgz")
md5sums=('680481536764f8918fd68c757ffd1607')
sha1sums=('cd7ba5ad202173a7d44d24f873f8e64811f8eea1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
