# Maintainer: Bernd Stramm <bernd.stramm@gmail.com>
# Packager: Samir Faci <csgeek@esamir.com> 

pkgname=egalite-git
pkgver=20100921
pkgrel=1
pkgdesc="direct chat client using qxmpp implementing  an almost server-less chat." 
arch=('i686'  'x86_64')
url="http://sourceforge.net/projects/egalite/"
license=('GPLv2')
groups=()
depends=('qt' 'qxmpp' 'qca')
makedepends=()
optdepends=()
provides=()
conflicts=(egalite)
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()

_gitroot='git://egalite.git.sourceforge.net/gitroot/egalite/egalite'
_gitname='egalite'
_buildir=${_gitname}-build


build() 
{
  cd ${srcdir}

  msg 'Connecting to GIT server...'

  if [ -d ${_gitname} ]; then
     cd ${_gitname} && git pull origin
     cd ..
  else
     git clone ${_gitroot}
  fi

  msg 'GIT checkout done or server timeout.'

  if [ -d ${_buildir} ]; then
     msg 'Cleaning previous build...'
     rm -rf ${_buildir}
  fi

  git clone ${_gitname} ${_buildir}

  cd ${_buildir}

  ./configure --qxmppname=qxmpp
  qmake 
  make
}

package() {
  cd "$srcdir/$_buildir"

  make PREFIX="${pkgdir}/usr" install
}

