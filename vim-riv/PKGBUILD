# Maintainer: Mizuchi <ytj000+AUR@gmail.com>

pkgname=vim-riv
pkgver=0.73
pkgrel=1
pkgdesc="reStructuredText in vim."
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=4112"
license=("unknown")
makedepends=("unzip" "python" "python-docutils" "python-pygments" "python-sphinx")
install=vimdoc.install
source=($pkgname.zip::http://www.vim.org/scripts/download_script.php?src_id=18838
        conf.py index.rst fixdoc.patch)

package() {

  mkdir -p $pkgdir/usr/share/vim
  mv $srcdir/Rykka-riv.vim-* $pkgdir/usr/share/vim/vimfiles
  rm $pkgdir/usr/share/vim/vimfiles/.gitignore

  rm -rf $srcdir/build-doc 
  mkdir -p $pkgdir/usr/share/doc/
  cp $pkgdir/usr/share/vim/vimfiles/doc $srcdir/build-doc -r
  cd $srcdir/build-doc 
  mkdir doctrees
  mv ../conf.py ../index.rst .
  patch -p 1 < $srcdir/fixdoc.patch
  sphinx-build -b html -d doctrees . html
  mv html $pkgdir/usr/share/doc/vim-riv
}

# vim:set ts=2 sw=2 et:
md5sums=('8f6a060c9b3ddc313c3709cc0f36a29f'
         '60eb11d88b7187c849b9430c6c6eb316'
         'ec4805a6ff4d98fc5f0aeedcef7e2071'
         '8eca5be2085ab17a9514c35826d64d92')
