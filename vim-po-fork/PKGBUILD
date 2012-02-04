# Maintainer: Omar Campagne <ocampagne at gmail com>

pkgname=vim-po-fork
pkgver=1.1
_src_id=11839
pkgrel=1
pkgdesc="Enhanced ftplugin for easier editing of GNU gettext PO files"
arch=('any')
url='http://vim.sourceforge.net/scripts/script.php?script_id=2530'
license=('custom:none')
install="vimdoc.install"
depends=('vim-runtime')
conflicts=('vim-po')
source=(po.tar::http://vim.sourceforge.net/scripts/download_script.php?src_id=$_src_id)
md5sums=('f0560b20a946713c1c60515b705f82a0')

build() {
  cd "$srcdir"
  _version_vimruntime=$(pacman -Q vim-runtime | awk \
  '{$0=gensub(/^[^0-9]*([0-9])\.([0-9]).*/,"\\1\\2","1");print }') 
  install -D -m644 ftplugin/po.vim "$pkgdir/usr/share/vim/vim$_version_vimruntime/ftplugin/po.vim"
  install -D -m644 doc/po.txt "$pkgdir/usr/share/vim/vim$_version_vimruntime/doc/po.txt"
}
