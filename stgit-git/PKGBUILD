# Maintainer: Gergely Imreh <imrehgATgmailDOTcom>
pkgname=stgit-git
pkgver=20120217
pkgrel=1
pkgdesc="Pushing/popping patches to/from a stack on top of Git, similar to Quilt, developement version."
url="http://www.procode.org/stgit/"
arch=('any')
license=('GPL')
depends=('python2' 'git')
provides=('stgit')
conflicts=('stgit')
source=()
md5sums=()

_gitroot="git://repo.or.cz/stgit.git"
_gitname="stgit"

build() {
  PYTHON=python2

  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  if [ -d ${srcdir}/${_gitname}-build ] ; then
    rm -r "${srcdir}/${_gitname}-build"
  fi
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  #
  # BUILD HERE
  #
  $PYTHON setup.py install --root=${pkgdir} --prefix=/usr || return 1

  rm -rf "${srcdir}/${_gitname}-build"
} 
