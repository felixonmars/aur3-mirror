# Maintainer: Felip Manyer i Ballester <archlinux at res hyphen telae dot cat>
# Contributor: Alex Ferrando <alferpal@gmail.com>
# Contributor: Zhang Li <richselian at gmail.com>

pkgname=vim-syntastic
pkgver=3.4.0
_scriptid=21627
pkgrel=2
pkgdesc="Vim automatic syntax checking"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2736"
license=('MIT')
depends=("vim")
groups=('vim-plugins')
install=vimdoc.install
source=("${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}")

md5sums=('ad97450541bc69bd2d3b05f1eb5117bc')

package() {
    mkdir -p $pkgdir/usr/share/vim/vimfiles/{plugin,doc,autoload/syntastic/,syntax_checkers}
    cd "$srcdir"
    find . -type d -exec chmod 755 '{}' \;
    cp -r plugin/* $pkgdir/usr/share/vim/vimfiles/plugin/
    cp doc/syntastic.txt $pkgdir/usr/share/vim/vimfiles/doc/
    cp autoload/syntastic/* $pkgdir/usr/share/vim/vimfiles/autoload/syntastic/
    cp -r syntax_checkers/* $pkgdir/usr/share/vim/vimfiles/syntax_checkers/
    chmod 755 $pkgdir/usr/share/vim/vimfiles/syntax_checkers
}
