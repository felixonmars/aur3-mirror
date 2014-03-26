pkgname=vim-freefem-git
pkgver=0+5+ge1e8e1c
pkgrel=1
pkgdesc='Vim syntax for FreeFem++'
arch=('i686' 'x86_64')
url="https://github.com/holomorph/vim-freefem"
license=('MIT')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
source=('git+https://github.com/holomorph/vim-freefem')
sha256sums=('SKIP')

pkgver() {
  cd 'vim-freefem'
  printf "%s+%s+g%s" "0" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd 'vim-freefem'
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim: ts=2 sw=2 et
