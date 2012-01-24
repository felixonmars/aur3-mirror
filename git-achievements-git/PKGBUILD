#Maintainer: Gergely Imreh <imrehg(at)gmail(dot)com>
pkgname=git-achievements-git
pkgver=20120124
pkgrel=1
pkgdesc="Aquire achievements while using git, developement version."
arch=(any)
url="http://github.com/icefox/git-achievements"
license=('Custom')
depends=('git')
source=()
options=()
install="${pkgname}.install"
provides=('git-achievements')

_gitroot=git://github.com/icefox/git-achievements.git
_gitname=git-achievements

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
    msg "GIT checkout done or server timeout"
  fi

  cd "${srcdir}/${_gitname}"
  install -D -m755 git-achievements "${pkgdir}/usr/bin/git-achievements"
}
