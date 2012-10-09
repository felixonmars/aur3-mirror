# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=vim-vimlite
_pkgname=VimLite
pkgver=0.9.5.1
_pkgver=797
_scriptid=18746
pkgrel=1
pkgdesc='Make vim as a C/C++ IDE inspired by CodeLite'
arch=('any')
url='http://vim.org/scripts/script.php?script_id=3647'
license=('custom:vim')
groups=('vim-plugins')
depends=('vim-runtime' python gcc make gdb cscope)
makedepends=()
optdepends=(python-lxml)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='vimdoc.install'
source=("${_pkgname}-${pkgver}.tar.bz2::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}")

build() {
	cd "$srcdir"/${_pkgname}-${_pkgver}

	_vim_dir='usr/share/vim/vimfiles'

  vim -c "UseVimball ./" -c "q" ${_pkgname}.vba
  install -dm755 ${pkgdir}/${_vim_dir}

  tar -c ./ \
    --exclude ${_pkgname}.vba \
    --exclude .VimballRecord \
    | tar -x -C ${pkgdir}/${_vim_dir}

  rm -f "$pkgdir"/${_vim_dir}/doc/tags
}
md5sums=('4a92efc33de33480886047dd54f140d2')
