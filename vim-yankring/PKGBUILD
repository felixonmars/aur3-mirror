# Contributor: vti <viacheslav.t at gmail dot com>
# Contributor: Danny Navarro <j@dannynavarro.net>

pkgname=vim-yankring
_id=20842
pkgver=18.0
pkgrel=1
pkgdesc="Maintains a history of previous yanks, changes and deletes."
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1234"
license=('GPL')
depends=('vim')
install=$pkgname.install
source=("$pkgname-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=$_id")
sha1sums=('abe19fdc8930be08f5049b49dcd4ee26ff1eca45')

package() {
  cd "$srcdir"

  install -Dm644 plugin/yankring.vim \
    "$pkgdir/usr/share/vim/vimfiles/plugin/yankring.vim"
  install -Dm644 doc/yankring.txt \
    "$pkgdir/usr/share/vim/vimfiles/doc/yankring.txt"
}

# vim:set ts=2 sw=2 et:
