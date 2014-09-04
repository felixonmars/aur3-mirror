# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-moonscript-git
pkgver=20140304
pkgrel=1
pkgdesc="MoonScript support for Vim"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/leafo/moonscript-vim"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/leafo/moonscript-vim)
sha256sums=('SKIP')
provides=('vim-moonscript')
conflicts=('vim-moonscript')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-moonscript/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in ftdetect ftplugin indent syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
