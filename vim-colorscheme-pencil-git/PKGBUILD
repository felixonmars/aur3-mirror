# Maintainer: Gently <toddrpartridge@gmail.com>

pkgname=vim-colorscheme-pencil-git
pkgver=r88.b79c517
pkgrel=1
pkgdesc="A Vim light (& dark) color scheme inspired by iA Writer."
arch=("any")
url="https://github.com/reedes/vim-colors-pencil"
license=("MIT")
depends=("vim")
makedepends=("git")
install=
changelog=
source=("git://github.com/reedes/vim-colors-pencil")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"
  mv vim-colors-pencil "$pkgname"
  cd "$srcdir"/$pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 LICENSE   "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 colors/pencil.vim "$pkgdir"/usr/share/vim/vimfiles/colors/pencil.vim
}

# vim:set ts=2 sw=2 et:
