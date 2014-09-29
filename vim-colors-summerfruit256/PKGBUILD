# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-summerfruit256
pkgver=0.1
_srcid=10153
pkgrel=1
pkgdesc="88/256 color version of Armin Ronacher's summerfruit color scheme"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=2577"
license=('custom:vim')
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
sha256sums=('7aeffd519afe7b02b3b895b7f4e83d6d5bb290b70e80288584c1f5033145f7b9')

package() {
  msg 'Installing...'
  install -Dm 644 "$srcdir/$pkgname" "$pkgdir/usr/share/vim/vimfiles/colors/summerfruit256.vim"
}
