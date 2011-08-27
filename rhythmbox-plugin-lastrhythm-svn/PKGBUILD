#Contributor: kasa <biuta.jr@gmail.com>

pkgname=rhythmbox-plugin-lastrhythm-svn
pkgver=57
pkgrel=1
pkgdesc="A plugin that provides recommendations from last.fm"
arch=(i686 x86_64)
url="http://usrportage.de/archives/763-the-last-rhythm-for-me.html"
depends=('rhythmbox' 'python-elementtree')
makedepends=('subversion')
license=('GPL')
options=(!libtool)
source=()
md5sums=()

_svntrunk=https://svn.usrportage.de/lastrhythm/trunk/
_svnmod=lastrhythm

build() {
  cd $startdir/src
  msg "Connecting to SVN server...."
  svn co $_svntrunk -r $pkgver $_svnmod || return 1
  msg " checkout done."

  mkdir -p $startdir/pkg/usr/lib/rhythmbox/plugins
  cp -R $startdir/src/lastrhythm $startdir/pkg/usr/lib/rhythmbox/plugins

  rm -fr $startdir/pkg/usr/lib/rhythmbox/plugins/lastrhythm/.svn
  rm -fr $startdir/pkg/usr/lib/rhythmbox/plugins/lastrhythm/{container,image,pyscrobbler}/.svn
}
