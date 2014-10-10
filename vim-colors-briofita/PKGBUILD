# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-briofita
pkgver=3.1.0
_srcid=21572
pkgrel=1
pkgdesc="Very thorough, dark background GUI-only colorscheme with user-selectable options"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=4136"
license=('custom:vim')
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
sha256sums=('dfb9f3c00c3e1181b37eee945bac705742909506c2f8d98fed29e1ee8a6b507c')
install=briofita.install

package() {
  cd "$srcdir/briofita"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in colors doc plugin; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done
}
