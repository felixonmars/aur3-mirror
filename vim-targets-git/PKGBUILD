# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-targets-git
pkgver=20140822
pkgrel=1
pkgdesc="Adds various text objects to give you more targets to operate on"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/wellle/targets.vim"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/wellle/targets.vim)
sha256sums=('SKIP')
provides=('vim-targets')
conflicts=('vim-targets')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/vim-targets/LICENSE"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-targets/README.md"
  install -Dm 644 cheatsheet.md "$pkgdir/usr/share/doc/vim-targets/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
