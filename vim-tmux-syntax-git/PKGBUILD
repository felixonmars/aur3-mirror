# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-tmux-syntax-git
pkgver=20140909
pkgrel=1
pkgdesc="Vim syntax for tmux configuration files"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/whatyouhide/vim-tmux-syntax"
license=('WTFPL')
source=(${pkgname%-git}::git+https://github.com/whatyouhide/vim-tmux-syntax)
sha256sums=('SKIP')
provides=('vim-tmux-syntax')
conflicts=('vim-tmux-syntax')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-tmux-syntax/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in ftdetect ftplugin syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
