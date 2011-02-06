# Contributor:  alterecco <alterecco@gmail.com>

pkgname=plait-svn
pkgver=20
pkgrel=3
pkgdesc="command-line jukebox and music player front end"
url="http://stephenjungels.com/jungels.net/projects/plait/"
arch=('i686' 'x86_64')
license=('GPL2')
provides=("plait")
conflicts=("plait")
depends=("subversion")
optdepends=('mpd/mpc: mpd support'
    'vorbis-tools: ogg123 support'
    'mpg123: mpg123 support'
    'mpg321: mpg321 support'
    'xmms: Xmms support'
    'bmp: Beep Media Player support'
    'amarok: amaroK support')

_svntrunk=https://plait.svn.sourceforge.net/svnroot/plait/trunk
_svnmod=plait

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  ./plait --install ${pkgdir}/usr || return 1

  # clean up install
  sed -i -e 's:^INSTALLDIR.*:INSTALLDIR="/usr":' ${pkgdir}/usr/bin/plait
  sed -i -e 's#sed "s:.*:$INSTALLDIR:g" plait > $INSTALLDIR/bin/plait#sed "s:/usr:$INSTALLDIR:g" plait > $INSTALLDIR/bin/plait#' ${pkgdir}/usr/bin/plait
}
