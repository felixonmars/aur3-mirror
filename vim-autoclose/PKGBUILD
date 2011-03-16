# Maintainer: koral <koral atmailoo dot org>
# Contributor: koral <koral at mailoo dot org>
pkgname=vim-autoclose
pkgver=1.4
pkgrel=4
pkgdesc="Inserts matching bracket, paren, brace or quote"
arch=(i686 x86_64)
_scriptid=9223
url="http://www.vim.org/scripts/script.php?script_id=2009"
license=('Vim License')
depends=('vim')
groups=('vim-plugins')
#install=('vimdoc.install')
source=(autoclose.vim::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
md5sums=('c2664a3bee137c043ba03ead5ebe4ebf')
 
build() {
    install -Dm644 ${srcdir}/autoclose.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/autoclose.vim
}
