# Contributor: Nathan Owe <aur@ndowens04.tk>
pkgname=vim-xhtml
pkgver=1.2
pkgrel=1
pkgdesc="XHTML syntax highlighting for VIM"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=1236"
license=('unknown')
depends=('vim' 'vim-mathml' 'vim-svg')
source=('xhtml.vim')
md5sums=('ec5b4cbf210d43b24e373a7bd1669683') 

build() {
  cd $srcdir/

  install -d $pkgdir/usr/share/vim/plugin
  install xhtml.vim $pkgdir/usr/share/vim/plugin/
}

# vim:set ts=2 sw=2 et:
