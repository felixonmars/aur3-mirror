# Maintainer: holos

pkgname=vim-freefem
pkgver=0.1
pkgrel=1
pkgdesc='Vim syntax for FreeFem++'
arch=('i686' 'x86_64')
url="https://github.com/holomorph/vim-freefem"
license=('GPL')
groups=('vim-plugins')
depends=('vim')
install=vimdoc.install
source=("https://github.com/holomorph/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b1ba5d52f37e3124087f6b7f40fd1eac78823b9f90e1a8a9944e81b934f15e1d')

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
