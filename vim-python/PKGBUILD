# Maintainer: Jarek Sedlacek <jareksedlacek@gmail.com>

pkgname=vim-python
pkgver=3.3.6
_scriptid=21056
pkgrel=1
pkgdesc="Enhanced version of the python syntax highlighting script"
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=790"
license=('custom')
depends=(vim)
install=vim-python.install
optdepends=('python: 3.x version')
source=(python3.0.vim::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})

package() {
    install -Dm644 ${srcdir}/python3.0.vim ${pkgdir}/usr/share/vim/vimfiles/syntax/python3.0.vim
}

md5sums=('3a987f2a54e085152745ee72ff4b3649')
