# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-liquidcarbon
pkgver=1.1
_srcid=14080
pkgrel=3
pkgdesc="Matte dark-gray background with flat dark blue-slate trimmings, and colorful yet harmonious syntax highlighting, for Vim"
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=3274"
license=('MIT')
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
sha256sums=('b4153436c087c095ce260c984c596192b950b3d72af416c89bf5a604987b8217')
install=liquidcarbon.install

package() {
  msg 'Installing...'
  install -Dm 644 "$srcdir/$pkgname" "$pkgdir/usr/share/vim/vimfiles/colors/liquidcarbon.vim"
}
