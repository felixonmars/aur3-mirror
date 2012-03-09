# Contributor: Kevin Whitaker <eyecreate at gmail dot com>
# Contributor: Adria Arrufat <swiftscythe at gmail dot com>

pkgname=sumwars-svn
_pkgname=sumwars
pkgver=2407
pkgrel=1
pkgdesc="Summoning Wars is an open source role-playing game, featuring both a single-player and a multiplayer mode for about 2 to 8 players."
arch=('i686' 'x86_64')
options=(!strip)
url="http://sumwars.org/"
license=('GPL')
makedepends=('autoconf' 'subversion')
depends=('ogre' 'cegui' 'raknet2' 'freealut' 'enet' 'openal' 'libvorbis' 'poco')
source=(sumwars.sh sumwars.desktop) 
md5sums=('dfa97acfeecd00240a7c34fbf6454b58'
'6d63a38f2120fc154700317914514278')
_svntrunk=http://sumwars.svn.sourceforge.net/svnroot/sumwars/trunk
_svnmod=$_pkgname

build() {
  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod/
    svn update
    cd ../
  else
    svn co $_svntrunk $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  rm -rf ${srcdir}/$_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build/
  cmake . -DCMAKE_BUILD_TYPE=Debug
  #       cmake -DCMAKE_INSTALL_PREFIX=/usr
  make ||return 1
  #   make install is broken
  #       make DESTDIR=$pkgdir install ||return 1
  mkdir -p $pkgdir/opt/sumwars/save
  chmod 777 $pkgdir/opt/sumwars/save
  mkdir -p $pkgdir/usr/{bin,share/{applications,pixmaps}}
  install -m755 sumwars $pkgdir/opt/sumwars/sumwars||return 1
  install -m644 plugins.cfg $pkgdir/opt/sumwars/plugins.cfg ||return 1
  install -m644 ogre.cfg $pkgdir/opt/sumwars/ogre.cfg||return 1
  install -m644 resources.cfg $pkgdir/opt/sumwars/resources.cfg||return 1
  install -m644 authors.txt $pkgdir/opt/sumwars/authors.txt||return 1
  install -m644 resources/itempictures/shield.png $pkgdir/usr/share/pixmaps/sumwars.png||return 1
  install -m644 $srcdir/../sumwars.desktop $pkgdir/usr/share/applications/sumwars.desktop||return 1
  install -m755 $srcdir/../sumwars.sh $pkgdir/usr/bin/sumwars||return 1
  cp -r data $pkgdir/opt/sumwars/
  cp -r resources $pkgdir/opt/sumwars
  touch $pkgdir/opt/sumwars/CEGUI.log
  touch $pkgdir/opt/sumwars/Ogre.log
  touch $pkgdir/opt/sumwars/sumwars.log
  chmod 777 $pkgdir/opt/sumwars/*.log
}
