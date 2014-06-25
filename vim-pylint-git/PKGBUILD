# Maintainer: Patrice Peterson <runiq at archlinux dot us>
pkgname=vim-pylint-git
pkgver=0.5.r13.g2407481
pkgrel=1
pkgdesc="Compiler plugin for Python style checking tool"
arch=('any')
url="https://github.com/sashahart/pylint.vim"
license=('custom')
depends=('vim' 'python2-pylint')
makedepends=('git')
provides=('vim-pylint')
conflicts=('vim-pylint')
install=vimdoc.install
source=("$pkgname-$pkgver::git+https://github.com/sashahart/pylint.vim"
        'LICENSE')
sha256sums=('SKIP'
            '4689a6d3ed3bca186ab8fea8360f32fdbb84f84c82fb21698390202efa7b7d19')

pkgver() {
  cd "$pkgname-$pkgver"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 compiler/pylint.vim ${pkgdir}/usr/share/vim/vimfiles/compiler/pylint.vim
  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${_gitname}/LICENSE
}

# vim:set ts=2 sw=2 et:
