# Maintainer: Dariusz Dwornikowski <dariusz.dwornikowski@gmail.com>
pkgname=vim-powerline
pkgver=beta
_scriptid=17204
pkgrel=2
pkgdesc='A Vim plugin that lets create better-looking statuslines'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=3881'
license=('custom:vim')
depends=('vim')
source=("Lokaltog-vim-powerline-b330fe6.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
md5sums=('02ea54999b8c33de5a47deb46c867be2')

build() {
        cd "$srcdir/Lokaltog-vim-powerline-b330fe6/"
        local src="$srcdir/Lokaltog-vim-powerline-b330fe6"
        local installpath="$pkgdir/usr/share/vim/vimfiles"
       
        install -d ${installpath}/{doc,autoload,fontpatcher,plugin,powerline}
         cp -dpr --no-preserve=ownership ${src}/doc $installpath
         cp -dpr --no-preserve=ownership ${src}/autoload $installpath
         cp -dpr --no-preserve=ownership ${src}/plugin $installpath
         cp -dpr --no-preserve=ownership ${src}/powerline $installpath
         cp -dpr --no-preserve=ownership ${src}/fontpatcher $installpath
         chmod 644 -R ${installpath}/{doc,autoload,fontpatcher,plugin,powerline}
        }
