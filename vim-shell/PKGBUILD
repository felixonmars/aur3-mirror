# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-shell
pkgver=0.13.6
_srcid=22145
pkgrel=1
pkgdesc="Improved integration between Vim and its environment (fullscreen, open URL, background command execution)"
arch=('i686' 'x86_64')
depends=('vim' 'vim-misc-xolox' 'wmctrl')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=3123"
license=('MIT')
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_srcid})
sha256sums=('8b07b0dd7805bee29f58451f3614eef3ec2801c1b1df263a4ed0018de9fd3d9a')
install=vimdoc.install

package() {
  cd "$srcdir"

  msg 'Installing documentation...'
  install -Dm 644 INSTALL.md "$pkgdir/usr/share/doc/vim-shell/INSTALL.md"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-shell/README.md"
  install -Dm 644 TODO.md "$pkgdir/usr/share/doc/vim-shell/TODO.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc misc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done
}
