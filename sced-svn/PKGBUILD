# Contributor: Renato Budinich <rennabh at gmail dot com>
pkgname=sced-svn
pkgver=9335
pkgrel=1
pkgdesc="supercollider plugin for gedit"
arch=('i686')
url="http://artfwo.googlepages.com/sced"
license=('GPL3')
depends=('supercollider-svn' 'gedit' 'python3')
makedepends=('svn')
provides=('sced')
options=()
install=${pkgname}.install
source=()
md5sums=() 

_svnmod="sced"
_svntrunk="https://supercollider.svn.sourceforge.net/svnroot/supercollider/trunk/editors/sced "



build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    msg "Connecting to $_svnmod SVN server...."
  fi

  msg "SVN checkout done or server timeout"

  cd $_svnmod

  mkdir -p ${pkgdir}/usr/share/gtksourceview-2.0/language-specs
  cp data/supercollider.lang ${pkgdir}/usr/share/gtksourceview-2.0/language-specs

  mkdir -p ${pkgdir}/usr/share/mime/packages
  cp data/supercollider.xml $startdir/pkg/usr/share/mime/packages
 
  mkdir -p ${pkgdir}/usr/lib/gedit-2/plugins
  cp -r data/sced.gedit-plugin sced/ ${pkgdir}/usr/lib/gedit-2/plugins


}

# vim:set ts=2 sw=2 et:
