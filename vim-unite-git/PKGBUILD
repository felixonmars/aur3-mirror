# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-unite-git
pkgver=20140922
pkgrel=1
pkgdesc="Common extensible interface for searching and displaying lists of information from within Vim"
arch=('any')
depends=('vim' 'vim-vital-git')
makedepends=('git')
optdepends=('vim-vimproc: for various unite sources')
groups=('vim-plugins')
url="https://github.com/Shougo/unite.vim"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/Shougo/unite.vim)
sha256sums=('SKIP')
provides=('vim-unite')
conflicts=('vim-unite')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-unite/README.md"
  install -Dm 644 CONTRIBUTING.md "$pkgdir/usr/share/doc/vim-unite/CONTRIBUTING.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Removing vital.vim (provided by vim-vital-git)'
  rm -f "$pkgdir/usr/share/vim/vimfiles/autoload/vital.vim"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
