# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-vimix-git
pkgver=20140619
pkgrel=1
pkgdesc="Changes Vimux runner directory to Elixir project root and detects correct test file"
arch=('any')
depends=('vim' 'vimux-git' 'elixir')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/spiegela/vimix"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/spiegela/vimix)
sha256sums=('SKIP')
provides=('vim-vimix')
conflicts=('vim-vimix')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-vimix/README.md"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in plugin; do
    cp -R $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
