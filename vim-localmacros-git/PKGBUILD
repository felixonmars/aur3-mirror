# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-localmacros-git
pkgver=20120731
pkgrel=1
pkgdesc="Store and execute macros in current file"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/dahu/VimLocalMacros"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/dahu/VimLocalMacros)
sha256sums=('SKIP')
provides=('vim-localmacros')
conflicts=('vim-localmacros')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README "$pkgdir/usr/share/doc/vim-localmacros/README"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
