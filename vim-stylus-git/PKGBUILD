# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-stylus-git
pkgver=20140521
pkgrel=1
pkgdesc="Stylus syntax highlighting for Vim"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/wavded/vim-stylus"
license=('MIT')
source=(git+https://github.com/wavded/vim-stylus)
sha256sums=('SKIP')
provides=('vim-stylus')
conflicts=('vim-stylus')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 readme.md "$pkgdir/usr/share/doc/vim-stylus/readme.md"
  install -Dm 644 changelog.md "$pkgdir/usr/share/doc/vim-stylus/changelog.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in ftdetect ftplugin indent syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
