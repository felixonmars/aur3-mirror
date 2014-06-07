# Maintainer: couplewavylines <couplewavylines at gmail dot com>
pkgname="vim-nrrwrgn-git"
pkgver=r262.558a19a
pkgrel=1
pkgdesc='A Narrow Region plugin for Vim'
arch=('any')
url='https://github.com/chrisbra/NrrwRgn'
license=('custom:vim')
groups=('vim-plugins')
depends=('vim')
conflicts=('vim-nrrwrgn')
provides=('vim-nrrwrgn')
makedepends=('git')
install='vimdoc.install'
source=("vim-nrrwrgn::git+https://github.com/chrisbra/NrrwRgn.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/vim-nrrwrgn"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/vim-nrrwrgn"

  installpath="${pkgdir}/usr/share/vim/vimfiles"

  install -Dm644 autoload/nrrwrgn.vim "$installpath/autoload/nrrwrgn.vim"
  install -Dm644 doc/NarrowRegion.txt "$installpath/doc/NarrowRegion.txt"
  install -Dm644 plugin/NrrwRgn.vim "$installpath/plugin/NrrwRgn.vim"
}

# vim:set ts=2 sw=2 et:
