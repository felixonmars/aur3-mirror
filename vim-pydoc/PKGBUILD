# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Mineo <the_mineo@web.de>
# Contributor: Florian Friesdorf <archlinux@chaoflow.net>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
# Contributor: Robson R S Peixoto <robsonpeixoto@gmail.com>

pkgname=vim-pydoc
pkgver=2.0
_scriptid=18164
_name=python_pydoc.vim
pkgrel=1
pkgdesc="Search and view python documentation from within vim (uses pydoc)"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=910"
license=('GPL')
groups=('vim-plugins')
# Change python2 to python if you're only using it with pydoc3
depends=('vim' 'python2')
source=(${_name}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('49cd60b67587112cec52d4a5cfa8b611')

build() {
    install -Dm644 ${srcdir}/${_name} ${pkgdir}/usr/share/vim/vimfiles/ftplugin/${_name}
}

# vim:set ts=2 sw=2 et:
