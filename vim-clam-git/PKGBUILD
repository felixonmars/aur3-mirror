# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-clam-git
pkgver=20120908
pkgrel=1
pkgdesc="A lightweight Vim plugin for working with shell commands"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/sjl/clam.vim"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/sjl/clam.vim)
sha256sums=('SKIP')
provides=('vim-clam')
conflicts=('vim-clam')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE.markdown "$pkgdir/usr/share/licenses/vim-clam/LICENSE.markdown"

  msg 'Installing documentation...'
  install -Dm 644 README.markdown "$pkgdir/usr/share/doc/vim-clam/README.markdown"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in clamsyntax doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
