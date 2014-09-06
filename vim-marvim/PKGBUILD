# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-marvim
pkgver=0.4
_srcid=9289
pkgrel=1
pkgdesc="Give your most complex macros a name and store them for future recall and use"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="https://sites.google.com/site/chamindra02/marvim"
license=('GPL2')
source=(${pkgname}.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=${_srcid})
sha256sums=('f634d2b44316a37f1d9c9d6820023f3759a4b061a3698f94dd18ede10423a5dd')
install=vimdoc.install

package() {
  cd "$srcdir/marvim"

  msg 'Installing documentation...'
  install -Dm 644 README "$pkgdir/usr/share/doc/vim-marvim/README"
  cp -dpr --no-preserve=ownership examples "$pkgdir/usr/share/doc/vim-marvim"

  msg 'Installing...'
  install -Dm 644 marvim.vim "$pkgdir/usr/share/vim/vimfiles/plugin/marvim.vim"
}
