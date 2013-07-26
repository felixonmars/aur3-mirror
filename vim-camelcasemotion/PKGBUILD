pkgname=vim-camelcasemotion
_scriptname=camelcasemotion
_scriptid=16854
pkgver=1.52
pkgrel=3
pkgdesc='Motion through CamelCaseWords and underscore_notation'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=1905'
license=('custom:vim')
groups=('vim-plugins')
depends=('vim-runtime>=7.0')
makedepends=('vim-runtime>=7.0')
install='vimdoc.install'
source=("${_scriptname}.vba.gz::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}")
md5sums=('3572e68d7b9491b4ac006cd3c4eb91ca')

package() {
    cd ${srcdir}
    vim -c "UseVimball ." -c "q" camelcasemotion.vba.gz
    installpath="$pkgdir/usr/share/vim/vimfiles"
    install -d $installpath/{autoload,doc,plugin}
    install -m644 autoload/camelcasemotion.vim $installpath/autoload/
    install -m644 doc/camelcasemotion.txt      $installpath/doc/
    install -m644 plugin/camelcasemotion.vim   $installpath/plugin/
}
