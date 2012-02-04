# Contributor: nofrak <nofrak/polattack/com>
# Maintainer: Hervé Cauwelier <herve/oursours/net>

pkgname=vim-pyflakes-python2
pkgver=3.01
_scriptid=14403
pkgrel=2
pkgdesc='Vim plugin which highlights common Python errors like misspelling a variable name on the fly.'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=2441'
depends=('vim' 'python2>=2.5')
conflicts=('vim-pyflakes')
source=("pyflakes-vim.zip::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
license=('custom')
md5sums=('a6db3f0c44127174cf35dfa6120e9f53')
build() {
  # Explicitly point to Python 2
  cd $srcdir
  sed -i 's/#!\/usr\/bin\/python/#!\/usr\/bin\/python2/g' ftplugin/python/pyflakes/bin/pyflakes

  mkdir -p $pkgdir/usr/share/vim/vimfiles/after/
  cp -r ftplugin $pkgdir/usr/share/vim/vimfiles/after/

  # License
  mkdir -p $pkgdir/usr/share/licenses/vim-pyflakes/
  mv $pkgdir/usr/share/vim/vimfiles/after/ftplugin/python/pyflakes/LICENSE $pkgdir/usr/share/licenses/vim-pyflakes/LICENSE
}
# vim:syntax=sh
