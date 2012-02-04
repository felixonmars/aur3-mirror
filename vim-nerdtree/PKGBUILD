# Maintainer: Kwpolska <kwpolska@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-nerdtree
pkgver=4.2.0
_scriptid=17123
pkgrel=2
pkgdesc='A tree explorer plugin for navigating the filesystem'
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=1658"
license=('custom')
depends=('vim')
groups=('vim-plugins')
install='vimdoc.install'
source=("${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}"
        'license.txt')
md5sums=('39e61096eb0c54a4d386eaba49d6de3d'
         'efbd5986e691ce8c876fb86e8f5961ea')

package() {
  install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,nerdtree_plugin,plugin,syntax}

  install -D -m644 ${srcdir}/doc/* \
    ${pkgdir}/usr/share/vim/vimfiles/doc/

  install -D -m644 ${srcdir}/nerdtree_plugin/* \
    ${pkgdir}/usr/share/vim/vimfiles/nerdtree_plugin/

  install -D -m644 ${srcdir}/plugin/* \
    ${pkgdir}/usr/share/vim/vimfiles/plugin/

  install -D -m644 ${srcdir}/syntax/* \
    ${pkgdir}/usr/share/vim/vimfiles/syntax/

  install -D -m644 ${srcdir}/license.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

