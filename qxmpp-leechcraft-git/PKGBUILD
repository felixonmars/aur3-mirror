# Maintainer: archtux <antonio.arias99999 at gmail.com>

pkgname=qxmpp-leechcraft-git
pkgver=20140623.07ae4a6
pkgrel=1
pkgdesc="QXmpp is a cross-platform C++ XMPP client library. It is based on Qt."
arch=('i686' 'x86_64')
url="http://leechcraft.org"
license='GPL3'
depends=('qt4>=4.6')
makedepends=('git')
conflicts=(qxmpp)

_gitname=qxmpp-dev
_gitroot=git://github.com/mtdcr/qxmpp-dev.git
#_gitroot=git://github.com/0xd34df00d/qxmpp-dev.git

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo "$(git log -1 --format='%cd.%h' --date=short | tr -d -)"
}



build() {
  cd $srcdir

  msg "Connecting to GIT server...."
   if [ -d ${_gitname} ] ; then
     cd ${_gitname} && git pull origin
     msg "The local files are updated."
     cd $srcdir
   else
     git clone ${_gitroot} ${_gitname}
   fi
   msg "GIT checkout done or server timeout"

  msg "Starting make..." 
   cd $srcdir  
   rm -rf ${_gitname}-build
   mkdir ${_gitname}-build
   cd ${_gitname}
   qmake-qt4 qxmpp.pro -r -config release
   make 
}

package() {
  cd $srcdir/${_gitname}

  make INSTALL_ROOT=$pkgdir install
}
