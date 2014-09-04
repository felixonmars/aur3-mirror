# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-nodejs-errorformat-git
pkgver=20130328
pkgrel=1
pkgdesc="A simple Vim plugin that allows you to execute any opened node.js file with :make and provides errorformat settings that allow you to quickly jump to any file / line numbers referenced in a stack trace"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/felixge/vim-nodejs-errorformat"
license=('MIT')
source=(git+https://github.com/felixge/vim-nodejs-errorformat)
sha256sums=('SKIP')
provides=('vim-nodejs-errorformat')
conflicts=('vim-nodejs-errorformat')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 Readme.md "$pkgdir/usr/share/doc/vim-nodejs-errorformat/Readme.md"
  cp -dpr --no-preserve=ownership example.js screenshots "$pkgdir/usr/share/doc/vim-nodejs-errorformat"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in ftplugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
