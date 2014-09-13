# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-iceberg
pkgver=0.4
_srcid=21612
pkgrel=1
pkgdesc="A dark blue color scheme for Vim. It brings a cool-headed perspective for your happy coding"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://cocopon.me/app/vim-iceberg"
license=('MIT')
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
sha256sums=('f585509ef19ffe34d523e17e60bf6f27cab0320c2e90417293d6bcd63a23d895')
provides=('vim-colors-iceberg' 'vim-iceberg')
conflicts=('vim-iceberg')
install=iceberg.install

package() {
  cd "$srcdir/iceberg.vim"

  msg 'Installing license...'
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/vim-colors-iceberg/LICENSE.txt"

  msg 'Installing docs...'
  install -Dm 644 CHANGES.txt "$pkgdir/usr/share/doc/vim-colors-iceberg/CHANGES.txt"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-colors-iceberg/README.md"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in colors; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done
}
