# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-partial-git
pkgver=20140224
pkgrel=1
pkgdesc="Simple inline code generator"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/naquad/Partial.vim"
license=('WTFPL')
source=(${pkgname%-git}::git+https://github.com/naquad/Partial.vim)
sha256sums=('SKIP')
provides=('vim-partial')
conflicts=('vim-partial')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-partial/README.md"

  msg 'Installing appdirs...'
  install -Dm 644 doc/partial.txt "$pkgdir/usr/share/vim/vimfiles/doc/partial.txt"
  for _appdir in plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
