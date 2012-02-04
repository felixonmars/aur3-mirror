# Maintainer : Weng Xuetian <hurricanek@126.com>

pkgname=vim-latexsuite
pkgver=20120125
_pkgver=1.8.23-20120125.768-git8b62284
pkgrel=2
pkgdesc="Provide a comprehensive set of tools to view, edit and compile LaTeX documents in Vim. Together, they provide tools starting from macros to speed up editing LaTeX documents to functions for forward searching .dvi documents. "
arch=(any)
url="http://vim-latex.sourceforge.net/index.phpi"
depends=('vim')
groups=('vim-plugins')
source=("http://downloads.sourceforge.net/project/vim-latex/snapshots/vim-latex-${_pkgver}.tar.gz" license.txt)
license=('custom:vim')
optdepends=('texlive-bin' 'python2')
install=('vim-latexsuite.install')

build()
{
  cd $srcdir/vim-latex-${_pkgver}
  find . -type f -name *.py | xargs sed -i 's/\/usr\/bin\/python/\/usr\/bin\/python2/g'
  make DESTDIR="${pkgdir}" PREFIX='/usr' VIMDIR='/usr/share/vim/vimfiles' install || return 1

  mkdir -p ${pkgdir}/usr/share/licenses/vim-latexsuite/ || return 1
  install -Dm755 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/vim-latexsuite/ || return 1

}
md5sums=('f3cb2c76f1617f84297262c25938ad6d'
         'cd49910a3dde6fe0a7e24ebe8cbf7066')
