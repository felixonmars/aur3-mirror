# Maintainer: Omar Campagne <ocampagne at gmail com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=vim-po
pkgver=1.2
_scriptid=4159
pkgrel=2
pkgdesc="ftplugin for easier editing of GNU gettext PO files"
arch=('any')
url='http://vim.sourceforge.net/scripts/script.php?script_id=695'
license=('custom:none')
depends=('vim-runtime')
conflicts=('vim-po-fork')
source=(po-$pkgver.vim::http://vim.sourceforge.net/scripts/download_script.php?src_id=$_scriptid)
md5sums=('37d40fa22c98fd05dc91f0c588be79cb')

build() {
  cd "$srcdir"
  _version_vimruntime=$(pacman -Q vim-runtime | awk \
  '{$0=gensub(/^[^0-9]*([0-9])\.([0-9]).*/,"\\1\\2","1");print }') 
  install -D -m644 po-$pkgver.vim "$pkgdir/usr/share/vim/vim$_version_vimruntime/ftplugin/po.vim"
}
