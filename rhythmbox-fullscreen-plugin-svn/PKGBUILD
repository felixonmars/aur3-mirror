pkgname=rhythmbox-fullscreen-plugin-svn
pkgver=4
pkgrel=1
pkgdesc="An informative, simple plugin for displaying album art and playlist control"
arch=('any')
url="http://code.google.com/p/rhythmbox-fullscreen-plugin/"
license=('GPL2')
depends=('rhythmbox')
conflicts=('rhythmbox-fullscreen-plugin')
provides=('rhythmbox-fullscreen-plugin')
replaces=('rhythmbox-fullscreen-plugin')
makedepends=('subversion')

_svntrunk=http://rhythmbox-fullscreen-plugin.googlecode.com/svn/trunk/
_svnmod=FullscreenView

build() {
  cd "$srcdir"
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  cd $_svnmod
  # Build
  install -d $pkgdir/usr/lib/rhythmbox/plugins
  cp -R $srcdir/FullscreenView $pkgdir/usr/lib/rhythmbox/plugins
  rm $pkgdir/usr/lib/rhythmbox/plugins/FullscreenView/{README,LICENSE}
}

