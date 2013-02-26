# Maintainer: Hexcles Ma <bob1211 (at) gmail (dot) com>

pkgname=vim-phpcomplete-git
pkgver=20130225
pkgrel=2
pkgdesc="Enhanced omni complete for PHP (git version)"
arch=('i686' 'x86_64')
url=("https://github.com/shawncplus/phpcomplete.vim")
license=('custom')
provides=('vim-phpcomplete')
conflicts=('vim-phpcomplete')
groups=('vim-plugins')
makedepends=('git')
depends=('vim')
install='vimdoc.install'
_gitroot=("git://github.com/shawncplus/phpcomplete.vim.git")

build() {
  cd ${srcdir}

  ## Git checkout
  if [ -d ${srcdir}/.git ] ; then
    msg "Git checkout:  Updating existing tree"
    git pull origin
    msg "Git checkout:  Tree has been updated"
  else
    msg "Git checkout:  Retrieving sources"
    git clone ${_gitroot} .
  fi
  msg "Checkout completed"
}
package() {
  install -Dm644 ${srcdir}/autoload/phpcomplete.vim ${pkgdir}/usr/share/vim/vimfiles/autoload/phpcomplete.vim
}
