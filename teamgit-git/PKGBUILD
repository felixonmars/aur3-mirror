# Contributor: supern lee <supern.lee@gmail.com>
pkgname=teamgit-git
pkgver=20100412
pkgrel=1
pkgdesc="a visual git client tool"
arch=('any')
url="http://www.devslashzero.com/teamgit"
license=('GPL2')
depends=( 'qt>=4.4')
makedepends=('git')
provides=('teamgit')
conflicts=('teamgit' 'teamgit-git')
source=()
md5sums=()

_gitroot="git://gitorious.org/teamgit/mainline.git"
_gitname="teamgit"


build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull --rebase
  else
    git clone ${_gitroot} ${_gitname}
    cd ${_gitname}
  fi
  
  msg "GIT checkout done or server timeout"

  qmake || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

}
