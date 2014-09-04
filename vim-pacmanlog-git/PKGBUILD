# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-pacmanlog-git
pkgver=20130928
pkgrel=1
pkgdesc="Vim syntax highlighting for Pacman log files"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/vim-scripts/pacmanlog.vim"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/vim-scripts/pacmanlog.vim)
sha256sums=('SKIP')
provides=('vim-pacmanlog')
conflicts=('vim-pacmanlog')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README "$pkgdir/usr/share/doc/vim-pacmanlog/README"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
