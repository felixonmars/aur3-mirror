# Maintainer: (archdria) Adria Arrufat <swiftscythe (at) gmail.com>

pkgname=ksecrets-git
_realname=ksecrets
pkgver=20111223
pkgrel=1
pkgdesc="Secrets Management Infrastructure for KDE"
arch=('i686' 'x86_64')
url="http://quickgit.kde.org/?p=ksecrets.git&a=summary"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4' 'git' 'docbook-xsl')
provides=(${_realname})
conflicts=(${_realname})
#options=(!strip)
md5sums=()

_gitroot="git://anongit.kde.org/${_realname}.git"
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
 
  cmake . -DCMAKE_BUILD_TYPE=debugfull \
          -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
