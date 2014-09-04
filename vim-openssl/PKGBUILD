# Maintainer: vti <viacheslav.t at gmail dot com>
# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-openssl
pkgver=3.2
_srcid=8564
pkgrel=4
pkgdesc="Edit OpenSSL encrypted files and turn Vim into a password safe"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=2012"
license=('custom:vim')
source=(${pkgname}.vim::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
sha256sums=('c2a61b9b68bb1e2cdcb0084ffb35fc721c4950f544409e70615557aa4d0f72bc')
install='vimdoc.install'

package() {
  msg 'Installing...'
  install -Dm 644 "$srcdir/vim-openssl.vim" "$pkgdir/usr/share/vim/vimfiles/plugin/openssl.vim"
}
