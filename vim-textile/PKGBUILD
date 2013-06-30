# Maintainer: Alexej Magura <agm2819*gmail*>

pkgname=vim-textile
pkgver=0.3
pkgrel=5
pkgdesc="syntax highlighting and Textile rendering/preview support"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2305"
license=('unknown')
depends=('vim')
install=$pkgname.install
source=("http://www.vim.org/scripts/download_script.php?src_id=9427"
	"syntax-textile.patch")
md5sums=('ca68d541fea77a356d28500648cc1809'
	 '768b033764350fba476d3382b41b054d')

prepare() {
    
    patch -N --follow-symlinks "$srcdir/textile/syntax/textile.vim" "$srcdir/syntax-textile.patch" --verbose

}
package() {
    
    cd "$srcdir/textile"

    # plugin/
    install -Dm 644 plugin/textile.vim \
	$pkgdir/usr/share/vim/vimfiles/ftdetect/textile.vim

    # doc/
    install -Dm 644 doc/textile.txt \
	$pkgdir/usr/share/vim/vimfiles/doc/textile.txt

    # ftplugin/
    install -Dm 644 ftplugin/textile.vim \
	$pkgdir/usr/share/vim/vimfiles/ftplugin/textile.vim

    # syntax/ 
    install -Dm 644 syntax/textile.vim \
	$pkgdir/usr/share/vim/vimfiles/syntax/textile.vim

}
