# Contributor: JD Horelick <jdhore1@gmail.com

pkgname=e4r-git
pkgver=20091009
pkgrel=1
pkgdesc="A script to cripple vim and make it more like nano."
arch=("i686" "x86_64")
url="http://git.exherbo.org/?p=e4r.git;a=summary"
license=('GPL')
depends=('vim')
makedepends=('git')

_gitroot="git://git.exherbo.org/e4r.git"
_gitname="e4r"

source=()
md5sums=()

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull --rebase
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  DESTDIR=$pkgdir make install || return 1
}

