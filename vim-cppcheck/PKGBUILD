# Maintainer: Tianjiao Yin <ytj000@gmail.com>

pkgname=vim-cppcheck
pkgver=1.0
pkgrel=2
pkgdesc="Compiler definition for cppcheck"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=3017"
license=('custom')
depends=('vim')
groups=('vim-plugins')
source=('cppcheck.vba::http://www.vim.org/scripts/download_script.php?src_id=12628'
        'cppcheck.diff')
md5sums=('26b1029b5658eac0f828859e2cab5b31'
         '298b9bed041f5b04466e096a9cc51f3e')

package() {
  cd "$srcdir"
  mkdir -p ${pkgdir}/usr/share/vim/vimfiles
  vim -c "UseVimball ${pkgdir}/usr/share/vim/vimfiles" -c "q" cppcheck.vba
  patch ${pkgdir}/usr/share/vim/vimfiles/compiler/cppcheck.vim ${srcdir}/cppcheck.diff 
  rm ${pkgdir}/usr/share/vim/vimfiles/.VimballRecord
}

