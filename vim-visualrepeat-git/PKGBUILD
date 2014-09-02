# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-visualrepeat-git
pkgver=20131128
pkgrel=1
pkgdesc="Repeat command extended to visual mode"
arch=('any')
depends=('vim')
makedepends=('git')
optdepends=('vim-repeat: extended repeat in normal mode')
groups=('vim-plugins')
url="https://github.com/vim-scripts/visualrepeat"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/vim-scripts/visualrepeat)
sha256sums=('SKIP')
provides=('vim-visualrepeat')
conflicts=('vim-visualrepeat')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README "$pkgdir/usr/share/doc/vim-visualrepeat/README"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
