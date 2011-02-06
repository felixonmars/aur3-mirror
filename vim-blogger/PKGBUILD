# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=vim-blogger
pkgver=2.3
_scriptid=13583
pkgrel=1
pkgdesc="The only one vim script which handles Blogger. Powered by Metarw"
arch=("i686" "x86_64")
url="http://www.vim.org/scripts/script.php?script_id=2638"
license=('custom')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid} 
		license.txt)
md5sums=('f3f01eb8e01a69d8a5a09ea039df083f'
         'efbd5986e691ce8c876fb86e8f5961ea')


build() {
	cd $srcdir/blogger-$pkgver
    install -d ${pkgdir}/usr/share/vim/autoload/metarw/
    install -Dm755 autoload/metarw/* ${pkgdir}/usr/share/vim/autoload/metarw/ 
    install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

