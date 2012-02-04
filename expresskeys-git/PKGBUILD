# Contributor: petRUShka <petrushkin@yandex.ru>

pkgname=expresskeys-git
pkgver=20120130
pkgrel=1
pkgdesc="ExpressKeys support on Wacom tablets"
arch=('i686' 'x86_64')
url="http://expresskeys.ruivo.org/"
license="GPL"
depends=('xf86-input-wacom' 'libxtst' 'libxi')
source=()
md5sums=()

_gitroot="http://expresskeys.ruivo.org/expresskeys.git"
_gitname="expresskeys"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${_gitname}/.git ] ; then
    cd ${_gitname}
    git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
    cd ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  ./configure --prefix=/usr
  make
}

package(){
  cd ${srcdir}/${_gitname}
  make DESTDIR=${pkgdir} install
}
