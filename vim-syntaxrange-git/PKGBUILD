# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-syntaxrange-git
pkgver=20131128
pkgrel=1
pkgdesc="Define a different filetype syntax on regions of a Vim buffer"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/vim-scripts/SyntaxRange"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/vim-scripts/SyntaxRange)
sha256sums=('SKIP')
provides=('vim-syntaxrange')
conflicts=('vim-syntaxrange')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README "$pkgdir/usr/share/doc/vim-syntaxrange/README"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in autoload doc plugin; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
