# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-scribble
pkgver=1.2
_srcid=16599
pkgrel=1
pkgdesc="Allows for mixing of Racket code with plain text using an at-expression syntax"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=3756"
license=('custom:vim')
source=(scribble.vim::http://www.vim.org/scripts/download_script.php?src_id=${_srcid})
sha256sums=('6f482163949dd441031004edd785abad142abd61864f85e441df1e00453f0165')

package() {
  msg 'Installing...'
  install -Dm 644 "$srcdir/scribble.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/scribble.vim"
}
