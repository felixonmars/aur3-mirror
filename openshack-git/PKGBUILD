# Maintainer: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=openshack-git
pkgver=20131220
pkgrel=1
pkgdesc="amateur radio logbook"
arch=("x86_64" "i686")
url="http://dl2ic.de"
license=("GPL3")
depends=(qt5-base hamlib)
mkdepends=(qt5-tools)
provides=(openshack)
conflicts=(openshack)

_gitroot="git://github.com/7h0ma5/OpenShack.git"
_gitname="OpenShack"

build() {
  cd "$srcdir"

  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  cd "${srcdir}/${_gitname}"
  qmake PREFIX=${pkgdir}/usr OpenShack.pro
  make || return 1
}

package() {
  cd "${srcdir}/${_gitname}"
  make install || return 1
}