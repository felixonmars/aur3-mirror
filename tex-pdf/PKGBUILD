# Maintainer: Kevin <kevinvanrooij at gmail dot com>

pkgname=tex-pdf
pkgver=1.41
pkgrel=1
_scriptid=18261
pkgdesc="Vim plugin for lightweight TeX compilation" 
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=3230"
license=('unknown')
depends=('vim')
groups=('vim-plugins')
source=(${pkgname}.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('265515e570b851fa74907231b2178615')
 
package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/share/vim/vimfiles/plugin || return 1
  install -m644 ftplugin/tex/*.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/ || return 1
}


