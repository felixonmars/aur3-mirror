pkgname=vim-matlab
pkgver=1
pkgrel=1
pkgdesc="Edit Matlab M-files in Vim editor (indentation, syntax highlighting, tags , mlint support)"
arch=('any')
url="http://www.mathworks.com/matlabcentral/fileexchange/21798-editing-matlab-files-in-vim"
source=("${pkgname}.zip::http://www.mathworks.com/matlabcentral/fileexchange/21798-editing-matlab-files-in-vim?controller=file_infos&download=true")
license=('custom')
groups=('vim-plugins')
depends=('vim')
md5sums=('9237608f5098f8c302630aa5535fa1f0')
install=${pkgname}.install

package() {
	install -d ${pkgdir}/usr/share/vim/vimfiles/{compiler,doc,ftplugin,indent,syntax}

	install -Dm644 ${srcdir}/compiler/mlint.vim ${pkgdir}/usr/share/vim/vimfiles/compiler/mlint.vim

	install -Dm644 ${srcdir}/doc/matlab.txt ${pkgdir}/usr/share/vim/vimfiles/doc/matlab.txt

  # The matlab.vim ftplugin is in DOS format, and vim will complain about "" characters.
  sed -i 's///g' ${srcdir}/ftplugin/matlab.vim
	install -Dm644 ${srcdir}/ftplugin/matlab.vim ${pkgdir}/usr/share/vim/vimfiles/ftplugin/matlab.vim

	install -Dm644 ${srcdir}/indent/matlab.vim ${pkgdir}/usr/share/vim/vimfiles/syntax/matlab.vim

	install -Dm644 ${srcdir}/syntax/matlab.vim ${pkgdir}/usr/share/vim/vimfiles/syntax/matlab.vim

	install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

# vim:set ts=2 sw=2 et:
