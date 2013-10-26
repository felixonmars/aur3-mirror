# Maintainer: Raymond Wagenmaker <raymondwagenmaker@gmail.com>
pkgname=vim-qml-git
pkgver=12.782d8d1
pkgrel=1
pkgdesc="QML syntax highlighting for Vim"
arch=('any')
url="https://github.com/peterhoeg/vim-qml"
license=('unknown')
depends=('vim')
source=("$pkgname::git+https://github.com/peterhoeg/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  local dir
  for dir in ft{detect,plugin} indent syntax; do
    install -Dm644 "$dir/qml.vim" "$pkgdir/usr/share/vim/vimfiles/$dir/qml.vim"
  done
}

# vim:set ts=2 sw=2 et:
