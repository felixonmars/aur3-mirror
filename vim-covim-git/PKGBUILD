# Maintainer: Nicolas Cornu <ncornu@aldebaran-robotics.com>

pkgname=vim-covim-git
_gitname=covim
pkgver=138.659da7e
pkgrel=1
pkgdesc="collaborative editing for vim"
arch=('any')
url="https://github.com/FredKSchott/CoVim"
depends=('gvim' 'ctags' 'twisted')
makedepends=('git')
provides=('covim')
license=('custom')
groups=('vim-plugins')
install=vimdoc.install
source=(${_gitname}::git+https://github.com/FredKSchott/CoVim.git)
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd ${_gitname}
  installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -dm 755 "${installpath}"/{plugin,doc}
  install -m 644 plugin/CoVimClient.vim ${installpath}/plugin
  install -m 755 plugin/CoVimServer.py ${installpath}/plugin
  install -m 644 doc/CoVim.txt ${installpath}/doc
  install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${_gitname}/LICENSE
}
