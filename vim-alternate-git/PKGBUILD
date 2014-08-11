#Maintainer: Krzesimir Sarnecki <krzesimir.sarnecki@gmail.com>

pkgname=vim-alternate-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Switch between source and test files with :A-command in Erlang projects"
arch=('i686' 'x86_64')
url="https://github.com/cris/erlang-alternate.vim"
license=('MIT')
depends=('erlang' 'vim')
makedepends=('git')
source=("$pkgname"::'git+https://github.com/cris/erlang-alternate.vim.git')
md5sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    mkdir -p "$pkgdir"/usr/share/vim/vimfiles/{ftplugin,plugin}
    install -Dm644 ftplugin/erlang.vim "$pkgdir"/usr/share/vim/vimfiles/ftplugin/
    install -Dm644 plugin/erlang-alternate.vim "$pkgdir"/usr/share/vim/vimfiles/plugin/
}
