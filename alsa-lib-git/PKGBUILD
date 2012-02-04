# Maintainer:  John "Nephyrin" Schoenick <john@pointysoftware.net>
# Contributor: Luca Bennati <lucak3 at gmail dot com>

pkgname=alsa-lib-git
pkgver=20110923
pkgrel=1
pkgdesc="An alternative implementation of Linux sound support - GIT version"
arch=('i686' 'x86_64')
url="http://www.alsa-project.org"
depends=('glibc')
optdepends=('python2')
makedepends=('python2' 'git')
license=('GPL')
options=(!libtool)
conflicts=('alsa-lib')
provides=('alsa-lib=1.0.24.1')

_gitroot="git://git.alsa-project.org/alsa-lib.git"
_gitname="alsa-lib"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    ( cd $_gitname && git pull origin )
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  rm -rf "${_gitname}_build"
  cp -r "${_gitname}"{,_build}
  cd "${_gitname}_build"

  autoreconf -v --force --install
  
  ./configure --prefix=/usr --with-pythonlibs="-lpthread -lm -ldl -lpython2.7" --with-pythonincludes=-I/usr/include/python2.7
  
  make
}

package()
{
    cd "${srcdir}/${_gitname}_build"
    make DESTDIR=$pkgdir install
}
