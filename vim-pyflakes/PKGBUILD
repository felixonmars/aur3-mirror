# Maintainer: Alireza Savand <alireza.savand@gmail.com>
# Contributor: nofrak <nofrak@polattack.com>

pkgname=vim-pyflakes
pkgver=3.01
_scriptid=14288
pkgrel=2.1
pkgdesc='Vim plugin which highlights common Python errors like misspelling a variable name on the fly.'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=2441'
depends=('vim' 'python2>=2.5')
license=('custom')
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('16711b5c62afd23939dbe34465d046c5')

package() {
  cd $srcdir

  install -D -m644 $srcdir/pyflakes.vim $pkgdir/usr/share/vim/vimfiles/after/ftplugin/python/pyflakes.vim
  rm -rf pyflakes/pyflakes/test/ pyflakes/{NEWS.txt,setup.py}
  cp -r pyflakes $pkgdir/usr/share/vim/vimfiles/after/ftplugin/python/pyflakes

  mkdir -p $pkgdir/usr/share/licenses/vim-pyflakes/
  mv $pkgdir/usr/share/vim/vimfiles/after/ftplugin/python/pyflakes/LICENSE $pkgdir/usr/share/licenses/vim-pyflakes/LICENSE
}
