# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-lua-ftplugin-git
pkgver=20140714
pkgrel=1
pkgdesc="Lua file type plug-in for the Vim text editor"
arch=('any')
depends=('lua' 'vim' 'vim-misc-xolox')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/xolox/vim-lua-ftplugin"
license=('MIT')
source=(git+https://github.com/xolox/vim-lua-ftplugin)
sha256sums=('SKIP')
provides=('vim-lua-ftplugin')
conflicts=('vim-lua-ftplugin' 'vim-lua-support')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 INSTALL.md "$pkgdir/usr/share/doc/vim-lua-ftplugin/INSTALL.md"
  install -Dm 644 README.md  "$pkgdir/usr/share/doc/vim-lua-ftplugin/README.md"
  install -Dm 644 TODO.md    "$pkgdir/usr/share/doc/vim-lua-ftplugin/TODO.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc ftplugin misc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
