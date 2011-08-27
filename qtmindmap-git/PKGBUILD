# Maintainer: Dan Serban
# Contributor: Uli Armbruster (Army)

pkgname=qtmindmap-git
pkgver=latest
pkgrel=1
pkgdesc="MindMap written in QT, aims to provide the features of Freemind"
arch=(i686 x86_64)
url="http://qt-apps.org/content/show.php/QtMindMap?content=143083"
license=(GPL)
depends=(qt)
makedepends=(git)

_gitroot="git://gitorious.org/qtmindmap/qtmindmap.git"
_gitname="qtmindmap"

build()
{
  msg "Connecting to GIT server...."
  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg2 "The local files are updated."
    cd "${srcdir}"
  else
    git clone ${_gitroot} ${_gitname}
  fi
  msg2 "GIT checkout done or server timeout"
  [ -d ${_gitname}-build ] && rm -r ${_gitname}-build
  cp -a ${_gitname} ${_gitname}-build
  cd ${_gitname}-build
  qmake ${_gitname}.pro
  make
}

package()
{
  install -Dm755 ${_gitname}-build/${_gitname} "${pkgdir}"/usr/bin/qtmindmap
}

