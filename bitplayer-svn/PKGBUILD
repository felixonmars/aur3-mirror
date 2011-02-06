# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=bitplayer-svn
pkgver=43
pkgrel=1
pkgdesc="A Qt music player and cataloguer."
arch=('i686')
url="http://sourceforge.net/projects/bitplayer"
license=('GPL')
depends=('qt' 'phonon')
provides=('bitplayer')
conflicts=('bitplayer')
source=()
md5sums=()


_svntrunk=http://bitplayer.svn.sourceforge.net/svnroot/bitplayer
_svnmod=bitplayer

build() {

  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  qmake || return 1
  make || return 1
  
  mkdir -p $startdir/pkg/usr/{bin,share}
  cp -r $startdir/src/bitplayer-build $startdir/pkg/usr/share/bitplayer
  ln -sf /usr/share/bitplayer/bitplayer $startdir/pkg/usr/bin/bitplayer
#  make DESTDIR=$startdir/pkg/ install

  rm -rf $startdir/src/$_svnmod-build

}
