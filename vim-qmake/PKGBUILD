# Maintainer: Raymond Wagenmaker <raymondwagenmaker@gmail.com>
pkgname=vim-qmake
pkgver=0.1
pkgrel=1
pkgdesc="Vim syntax highlighting for qmake project files"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2983"
license=('unknown')
depends=('vim')
source=('qmake.vim::http://www.vim.org/scripts/download_script.php?src_id=12449'
        'ftdetect.vim')
md5sums=('f2f4830153ecd4bcb087fd4dace9079e'
         'df02435de62b170a33171d5912f5c70f')
noextract=('qmake.vim' 'ftdetect.vim')

package() {
  cd "$srcdir"
	install -Dm644 qmake.vim "$pkgdir/usr/share/vim/vimfiles/syntax/qmake.vim"
	install -Dm644 ftdetect.vim "$pkgdir/usr/share/vim/vimfiles/ftdetect/pro.vim"
}

# vim:set ts=2 sw=2 et:
