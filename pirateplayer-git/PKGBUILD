# created 14:21:01 - 12/10/10
# Maintainer: jackuess <chucky at wrutschkow.org> 

pkgname=pirateplayer-git
pkgver=20111012
pkgrel=1
pkgdesc="Qt-based utility for downloading (and in the future watching) swedish programming"
url="http://pirateplay.se/"
license="GPL"
arch=('i686' 'x86_64')
depends=('qt' 'rtmpdump')
makedepends=('git')
conflicts=('pirateplayer')
provides=('pirateplayer')

_gitroot='git://github.com/jackuess/pirateplayer.git'
_gitname='pirateplayer'

build() {
    cd ${srcdir}
  
      msg "Connecting to github.com GIT server...."
  if [ -d $srcdir/$_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
  else
      git clone $_gitroot
  fi
      msg "GIT checkout done or server timeout"
      
      msg "Starting make..."
  
  if [ -d ${srcdir}/$_gitname-build ]; then
      rm -r ${srcdir}/$_gitname-build
  fi
    cp -r $srcdir/$_gitname $srcdir/$_gitname-build
    cd $srcdir/$_gitname-build

    qmake PREFIX=/usr || return 1
    make INSTALL_ROOT=${pkgdir} install || return 1
}
