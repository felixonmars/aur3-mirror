# Maintainer: psi23 <killerpsi23 a^t gmail c@m>

pkgname=vim-template
pkgver=0.3.0
_scriptid=18080
pkgrel=1
pkgdesc="A Vim plugin to read the template file automatically when the edit of the file is newly started"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2834"
license=('ZLIB')
groups=('vim-plugins')
depends=('vim')
install=vimdoc.install
source=($pkgname-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid)
md5sums=('ed111070b54eb828f10cba7533346cd6')

package() {

  cd ${srcdir}

  installpath="${pkgdir}/usr/share/vim/vimfiles"

  install -Dm644 autoload/template.vim $installpath/autoload/template.vim
  install -Dm644 doc/template.txt $installpath/doc/template.txt
  install -Dm644 plugin/template.vim $installpath/plugin/template.vim

}
