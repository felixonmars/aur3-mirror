# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vimux
pkgver=1.0.0
_srcid=20361
pkgrel=2
pkgdesc="Easily interact with tmux from Vim"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=4011"
license=('MIT')
source=(${pkgname}-${pkgver}.zip::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
sha256sums=('f299507f905936287c142b51b0371728cc6984b24a1e7a73ee9ed16686fe7637')
install='vimdoc.install'

package() {
  cd "$srcdir/$pkgname"

  msg 'Installing documentation...'
  install -Dm 644 README.mkd "$pkgdir/usr/share/doc/vimux/README.mkd"

  msg 'Installing appdirs...'
  install -Dm 644 doc/vimux.txt "$pkgdir/usr/share/vim/vimfiles/doc/vimux.txt"
  for _appdir in plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done
}
