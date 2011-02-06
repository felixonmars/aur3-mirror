# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
pkgname=vim-csspretty
pkgver=1.0
pkgrel=1
pkgdesc="Pretty-print a css file with VIM"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=2137"
license=('unknown')
source=('csspretty.vim')
md5sums=('ff63907df588e6bffbef2333369c82bb') 

build() {
  cd $srcdir/

  install -d $pkgdir/usr/share/vim/plugin
  install csspretty.vim $pkgdir/usr/share/vim/plugin/
}

# vim:set ts=2 sw=2 et:
