# Maintainer: Yerko Escalona <yescalona.at.uchile.dot.ug.dot.cl>

pkgname=vim-debug-git
pkgver=20101121
pkgrel=1
pkgdesc="This plugin creates an integrated debugging environment in VIM."
arch=('any')
license=('MIT')
depends=('python2')
makedepends=('git' 'pydbgp-git')
url="http://jaredforsyth.com/projects/vim-debug/"
source=('debugger.vim')
md5sums=('583a6b20a1ffc7ea8738d46076157bcc')

_gitroot="git://github.com/jabapyth/vim-debug.git"
_gitname="vim-debug"

build() {
  cd ${srcdir}

  msg "Connecting to GIT server..."
  if [[ -d ${_gitname} ]]; then
    (cd ${_gitname} && git pull origin)
  else
    git clone ${_gitroot} ${_gitname}
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${_gitname}-build
  git clone ${_gitname} ${_gitname}-build

  cd ${srcdir}/${_gitname}-build
}

package() {
  cd ${srcdir}/${_gitname}-build
  python2 setup.py install --root=$pkgdir/ --optimize=1

  install -D -m644 ${srcdir}/debugger.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/debugger.vim
}
