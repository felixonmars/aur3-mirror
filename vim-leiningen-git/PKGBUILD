# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-leiningen-git
pkgver=20140530
pkgrel=1
pkgdesc="Static Vim support for Leiningen"
arch=('any')
depends=('leiningen' 'vim' 'vim-fireplace-git')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/tpope/vim-leiningen"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/tpope/vim-leiningen)
sha256sums=('SKIP')
provides=('vim-leiningen')
conflicts=('vim-leiningen')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.markdown "$pkgdir/usr/share/doc/vim-leiningen/README.markdown"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in compiler doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
