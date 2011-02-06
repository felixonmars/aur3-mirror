# Contributor: David Pernot <dpernot@gmail.com>
# Maintainer: David Pernot <dpernot@gmail.com>
pkgname=emacs-egg-git
pkgver=20100511
pkgrel=1
pkgdesc='Emacs interface to git'
arch=('i686' 'x86_64')
url='http://bogolisk.blogspot.com/'
license=('GPL3+')
makedepends=('emacs')
depends=('emacs' 'git')
replaces=('egg-git')
provides=('egg-git')
install=${pkgname}.install
source=()
md5sums=()

_gitroot="git://github.com/byplayer/egg.git"
_gitname="egg"

build() {
  cd $srcdir
  msg "Connecting to GIT server $_gitroot"
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

msg "GIT checkout done or server timeout"

cd $_gitname
install -Dm644 egg.el \
  ${pkgdir}/usr/share/emacs/site-lisp/egg.el || return 1
install -Dm644 egg-grep.el \
  ${pkgdir}/usr/share/emacs/site-lisp/egg-grep.el || return 1
}