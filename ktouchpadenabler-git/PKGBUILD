# Maintainer: (archdria) Adria Arrufat <swiftscythe (at) gmail.com>

pkgname=ktouchpadenabler-git
_realname=ktouchpadenabler
pkgver=20120125
pkgrel=1
pkgdesc="A simple KDED daemon to enable/disable the touchpad on the press of XF86XK_TouchpadToggle"
arch=('i686' 'x86_64')
url="http://quickgit.kde.org/?p=ktouchpadenabler.git&a=summary"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4' 'git')
provides=(${_realname})
conflicts=(${_realname})

_gitroot="git://anongit.kde.org/${_realname}"
_gitname=${_realname}
 
build() {
  cd ${srcdir}

  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/build
  git clone ${srcdir}/${_gitname} ${srcdir}/build
  cd ${srcdir}/build
 
  cmake . -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
