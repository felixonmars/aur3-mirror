# Maintainer: megadriver <megadriver at gmx dot com>
# Contributor: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=quadra-svn
pkgver=757
pkgrel=1
pkgdesc="A Tetris clone with single player and multiplayer capabilities"
url="http://code.google.com/p/quadra/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl' 'libpng')
makedepends=('subversion' 'autoconf' 'make' 'bc')
source=('quadra-gcc46.patch')
md5sums=('81a079dd475d8726337aba60644439a3')

_svntrunk=http://quadra.googlecode.com/svn/trunk/
_svnmod=quadra

build() {
  cd ${srcdir}
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn revert -R .)
    (cd ${_svnmod} && svn -r ${pkgver} up)
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  
  cd ${srcdir}/${_svnmod}/quadra
  patch -Np1 -i ${startdir}/quadra-gcc46.patch

  autoreconf
  ./configure --prefix=/usr --datadir=/usr/share/quadra
  make
}

package() {
  cd ${srcdir}/${_svnmod}/quadra
  mkdir -p ${pkgdir}/usr/share/{applications,quadra}
  echo "Categories=Game;ArcadeGame;" >> Quadra.desktop
  cp Quadra.desktop ${pkgdir}/usr/share/applications 
  mkdir -p ${pkgdir}/usr/share/quadra/{games,pixmaps}
  mkdir -p ${pkgdir}/usr/bin
  cp source/quadra ${pkgdir}/usr/bin
  cp quadra.res ${pkgdir}/usr/share/quadra/games
  cp images/quadra.xpm ${pkgdir}/usr/share/quadra/pixmaps
}
