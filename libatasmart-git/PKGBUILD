# Contributor: Michael Kanis <mkanis(at)gmx(dot)de>

pkgname=libatasmart-git
pkgver=20090712
pkgrel=1
pkgdesc="ATA S.M.A.R.T. reading and parsing library"
arch=('i686' 'x86_64')
url="http://0pointer.de/blog/projects/being-smart.html"
license=('LGPL')
depends=()
provides=(libatasmart)

_gitroot="git://git.0pointer.de/libatasmart.git"
_gitname="libatasmart"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/build
  git clone ${srcdir}/$_gitname ${srcdir}/build
  cd ${srcdir}/build

  ./bootstrap.sh --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  rm -rf ${srcdir}/build
}
