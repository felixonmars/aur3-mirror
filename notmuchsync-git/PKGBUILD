# Maintainer: Sara Fauzia <sara at archlinux dot us>
pkgname=notmuchsync-git
pkgver=20110414
pkgrel=1
pkgdesc="Two-way sync of notmuch tags and maildir flags"
arch=(i686 x86_64)
url="https://github.com/spaetz/notmuchsync"
license=('GPL2')
depends=('python2' 'notmuch')
makedepends=('git')
provides=('notmuchsync')
conflicts=('notmuchsync')

_gitroot="http://github.com/spaetz/notmuchsync.git"
_gitname="notmuchsync"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' ${_gitname}
}

package(){
  install -Dm755 "${srcdir}/${_gitname}-build/${_gitname}" "${pkgdir}/usr/bin/${_gitname}"
}