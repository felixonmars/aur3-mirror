# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=vim-fileline
pkgver=1.0
pkgrel=1
src_id=17417
pkgdesc="Opens file:line doing the right thing"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=2184"
license=('GPL3')
depends=('vim')
groups=('vim-plugins')
source=(fileline.vim::"http://www.vim.org/scripts/download_script.php?src_id=$src_id")
md5sums=('d48fb181a54c043b3040cdd5fa0d4ae5')

build() {
  true
}

package() {
  cd "${srcdir}"
  local _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -Dm644 fileline.vim "${_installpath}/plugin/fileline.vim"
}
