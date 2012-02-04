# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net> awagner on irc.freenode.net
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-hoogle
pkgver=1.3
_scriptid=15024
pkgrel=3
pkgdesc="Add commands to use Hoogle within vim"
arch=('i686' 'x86_64')
url="http://www.vim.org/scripts/script.php?script_id=2672"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.vba.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
license.txt)

build() {
vim -c "UseVimball $srcdir" -c "q" ${pkgname}.vba
tr -d '\015' < $srcdir/vim-hoogle/plugin/hoogle.vim > t.$$ 
mv -f t.$$ $srcdir/vim-hoogle/plugin/hoogle.vim
mkdir -p ${pkgdir}/usr/share/vim/vimfiles/{doc,plugin}
cp -r ${srcdir}/vim-hoogle/{doc,plugin} ${pkgdir}/usr/share/vim/vimfiles
install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

md5sums=('ce94fb9e77eb3d3f10bbd9df1834cdf7'
'efbd5986e691ce8c876fb86e8f5961ea')
