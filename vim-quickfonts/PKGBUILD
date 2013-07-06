# Maintainer: Alexej Magura <agm2819*gmail*>
#
# Contributor: Laszlo Papp <djszapi @ gmail at com>
#
#
pkgname=vim-quickfonts
pkgver=1.29
_scriptid=4103
pkgrel=3
pkgdesc="Quickly switch between a list of favorite fonts, manage list of favorite fonts"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=202"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=("${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        "license.txt")
md5sums=('52cb057c646a98cfa121a0fa334c8032'
         'efbd5986e691ce8c876fb86e8f5961ea')

package () {

    cd $srcdir

    install -D -m 644 doc/quickfonts.txt \
	$pkgdir/usr/share/vim/vimfiles/doc/quickfonts.txt 
    
    install -D -m 644 plugin/quickfonts.vim \
	$pkgdir/usr/share/vim/vimfiles/plugin/quickfonts.vim

    install -D -m 644 license.txt \
	${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

