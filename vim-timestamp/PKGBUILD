# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=vim-timestamp
pkgver=1.21
_src_id=10283
pkgrel=3
pkgdesc='A Vim plugin for automated time stamping'
url="http://www.vim.org/scripts/script.php?script_id=923"
arch=('any')
license=('GPL')
depends=('vim')
install=vimdoc.install
source=($pkgname-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=$_src_id)
md5sums=('59822d1fa48169a2395048cb074089c1')

package() {
  cd "$srcdir/timestamp"
  install -Dm644 doc/timestamp.txt "$pkgdir/usr/share/vim/vimfiles/doc/timestamp.txt"
  install -Dm644 plugin/timestamp.vim "$pkgdir/usr/share/vim/vimfiles/plugin/timestamp.vim"
}

# vim:set ts=2 sw=2 et:
