pkgname=qxmpp-leechcraft
pkgver=20110617
pkgrel=1
pkgdesc="QXmpp is a cross-platform C++ XMPP client library. It is based on Qt."
arch=('i686' 'x86_64')
url="http://leechcraft.org"
license=('GPL3')
depends=('qt>=4.6' 'git')
makedepends=()
conflicts=(qxmpp)
provides=()
replaces=()
install=

_gitname=qxmpp-dev
_gitroot=git://github.com/0xd34df00d/qxmpp-dev.git

build() {
  cd ${srcdir}

  msg "Connecting to GIT server...."
   if [ -d ${_gitname} ] ; then
     cd ${_gitname} && git pull origin
     msg "The local files are updated."
     cd ${srcdir}
   else
     git clone ${_gitroot} ${_gitname}
   fi
   msg "GIT checkout done or server timeout"

  msg "Starting make..." 
   cd ${srcdir}  
   rm -rf ${_gitname}-build
   mkdir ${_gitname}-build
   cd ${_gitname}
   qmake
   make 
}

package() {
  cd "$srcdir/${_gitname}"

  make INSTALL_ROOT="$pkgdir/" install
}
