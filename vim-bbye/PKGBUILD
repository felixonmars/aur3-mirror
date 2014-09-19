# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-bbye
pkgver=1.0.1
_srcid=20560
pkgrel=1
pkgdesc="Delete buffers and close files in Vim without closing your windows or messing up your layout, like Bclose"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=4664"
license=('AGPL3')
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_srcid})
sha256sums=('d8e328b80c6673d56a25241e0b38915e33f774384105f0da393f9f4886e4d9f8')
install=vimdoc.install

package() {
  cd "$srcdir"

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/vim-bbye/LICENSE"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-bbye/README.md"
  install -Dm 644 CHANGELOG.md "$pkgdir/usr/share/doc/vim-bbye/CHANGELOG.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done
}
