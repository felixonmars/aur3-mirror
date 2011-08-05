
# Contributor: Pawel Stiasny <pawelstiasny@gmail.com>

pkgname='vitabs-git'
pkgver=20110806
pkgrel=1
pkgdesc="A guitar tablature editor inspired by Vim"
arch=(any)
url="https://github.com/PawelStiasny/VITABS"
license=('GPL3')
depends=('python2' 'python-portmidi')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
_gitroot="git://github.com/PawelStiasny/VITABS.git"
_gitname="VITABS"

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
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
