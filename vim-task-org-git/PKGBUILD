# Maintainer: Alexander Yunin <use.skills@gmail.com>
# You need vim compiled with ruby support
pkgname=vim-task-org-git 
pkgver=20110909
pkgrel=2
pkgdesc="Manipulate your TODO/FIXME/etc marks (tasks) in sources."
arch=('any')
url="http://github.com/iflo0/vim-task-org"
license=('BSD')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
install=vto.install

_gitroot="http://github.com/iflo0/vim-task-org.git"
_gitname="vim-task-org"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"
}

package() {
  cd ${srcdir}/${_gitname}-build
  install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,plugin}

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LEGAL || return 1;
  install -Dm644 doc/vto.txt ${pkgdir}/usr/share/vim/vimfiles/doc/ || return 1;
  install -Dm755 plugin/vto.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/ || return 1;
}
