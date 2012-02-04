# Maintainer: bangoskank <its.hip@gmail.com>

pkgname=megazeux-svn
pkgver=1315
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="A game creation system for ANSI-esque games, featuring an interactive editor and an object-oriented scripting language."
url="http://www.digitalmzx.net/"
license=('GPL')
depends=(libogg libpng libvorbis sdl)
makedepends=(subversion)
conflicts=(megazeux)
backup=(etc/megazeux-config)
source=()
md5sums=()

_svntrunk="https://megazeux.svn.sourceforge.net/svnroot/megazeux/trunk"
_svnmod="megazeux"

build() {

  if [ -d ${srcdir}/$_svnmod ]
  then
    svn up ${srcdir}/$_svnmod || return 1
  else
    svn co $_svntrunk ${srcdir}/$_svnmod || return 1
  fi
  
  cd ${srcdir}/$_svnmod
 
  ./config.sh --platform unix \
  --prefix /usr \
  --sysconfdir /etc \
  --gamesdir /usr/bin \
  --as-needed-hack \
  --enable-release \
  || return 1
  make || return 1
  make install DESTDIR=${pkgdir} || return 1
  
}
