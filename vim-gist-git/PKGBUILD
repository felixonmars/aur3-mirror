# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>

pkgname=vim-gist-git
pkgver=7.1
pkgrel=1
pkgdesc="Vim script for gist.github.com (git)"
arch=(any)
url="https://github.com/mattn/gist-vim"
license=(BSD)
depends=('vim>=7' vim-webapi)
optdepends=('git: git profile support')
provides=('vim-gist')
conflicts=('vim-gist')
install=vimdoc.install
source=(git://github.com/mattn/gist-vim.git)
md5sums=('SKIP')

package() {
    cd gist-vim
    mkdir -p "${pkgdir}"/usr/share/vim/vimfiles/
    cp -r autoload doc plugin README.mkd "${pkgdir}"/usr/share/vim/vimfiles/
}
