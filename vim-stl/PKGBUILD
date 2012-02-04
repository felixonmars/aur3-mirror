# Maintainer: koral <koral at mailoo dot org>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
pkgname=vim-stl
pkgver=0.1
pkgrel=4
pkgdesc="Improved C++ STL syntax highlighting"
arch=(any)
url="http://www.vim.org/scripts/script.php?script_id=2224"
license=('unknown')
groups=('vim-plugins')
provides=
depends=('vim')
optdepends=
makedepends=
conflicts=
replaces=('vim-cpp')
backup=
install=vimdoc.install
_scriptid=8628
source=(${pkgname}::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('7b313b30457d0b75d1e26b4336d838df')

build() {
    mkdir -p ${pkgdir}/usr/share/vim/vimfiles/after/syntax/cpp
    install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/share/vim/vimfiles/after/syntax/cpp/stl.vim
}
