# Maintainer SpepS <dreamspepser at yahoo dot it>

_name=hexhighlight
_scriptid=2937
_srcid=12150
pkgname=vim-$_name
pkgver=0.1
pkgrel=1
pkgdesc="This plugin looks for hex codes and toggles a highlight in that color."
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=$_scriptid"
license=('custom')
depends=('gvim')
groups=('vim-plugins')
install="vimdoc.install"
source=("$_name.vim::http://www.vim.org/scripts/download_script.php?src_id=$_srcid"
        "license.txt")
md5sums=('a179da37fdba9e99c99ca522811f4108'
         '9cbc86548400621ea7ad55d4386d81e2')

build() {
    install -Dm644 "$srcdir/$_name.vim" \
        "$pkgdir/usr/share/vim/vimfiles/plugin/$_name.vim"
    install -Dm644 "$srcdir/license.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
