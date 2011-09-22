# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=vim-insertchar
pkgver=1.0
pkgrel=1
_scriptid=11521
pkgdesc="Permits inserting single characters with ease"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2810"
license=('GPL')
depends=('vim')
groups=('vim-plugins')
install=vim-insertchar.install
source=(InsertChar.vim::"http://www.vim.org/scripts/download_script.php?src_id=$_scriptid")
md5sums=('c9c25384ef15a8de784dbc5f64f63c49')

build() {
  true
}

package() {
  cd "${srcdir}"
  local _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -Dm644 InsertChar.vim "${_installpath}/plugin/InsertChar.vim"
}
