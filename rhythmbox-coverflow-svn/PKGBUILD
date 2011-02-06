# Contributor: twa022 <twa022 at gmail dot com>

pkgname=rhythmbox-coverflow-svn
pkgver=3
pkgrel=1
pkgdesc="A plugin that provides a coverflow widget to rhythmbox audio player"
arch=(i686 x86_64)
url="http://code.google.com/p/rhythmbox-coverflow-plugin/"
depends=('rhythmbox' 'python-gtkglext')
makedepends=('subversion')
license=('GPL')
options=()
source=()
md5sums=()

_svntrunk=http://rhythmbox-coverflow-plugin.googlecode.com/svn/trunk/
_svnmod=rhythmbox-coverflow-plugin-read-only

build() {
  cd $startdir/src
  msg "Connecting to SVN server...."
  svn co $_svntrunk -r $pkgver $_svnmod || return 1
  msg " checkout done."

  mkdir -p $startdir/pkg/usr/lib/rhythmbox/plugins
  cp -R $startdir/src/rhythmbox-coverflow-plugin-read-only $startdir/pkg/usr/lib/rhythmbox/plugins

  rm -fr $startdir/pkg/usr/lib/rhythmbox/plugins/rhythmbox-coverflow-plugin-read-only/.svn
  rm -fr $startdir/pkg/usr/lib/rhythmbox/plugins/rhythmbox-coverflow-plugin-read-only/artflow/.svn
}
