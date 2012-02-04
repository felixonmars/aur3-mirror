# Maintainer:  Bjoern Lindig <bjoern dot lindig at googlemail dot com>
pkgname=sc3-plugins-svn
pkgver=453
pkgrel=1
pkgdesc="Extension plugins for the SuperCollider3 audio synthesis server (see <http://supercollider.sf.net>). These third-party plugins provide additional synthesis, analysis, and other capabilities for the sound server."
url="http://sourceforge.net/projects/sc3-plugins/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('supercollider-svn')
makedepends=('subversion' 'gcc>=3.0' 'pkgconfig>=0.14.0' 'scons>=0.96' 'alsa-lib')

_svntrunk=https://sc3-plugins.svn.sourceforge.net/svnroot/sc3-plugins
_svnmod=sc3-plugins

_svntrunk2=http://supercollider.svn.sourceforge.net/svnroot/supercollider/trunk/common/Headers/
_svnmod2=Headers
_svntrunk3=http://supercollider.svn.sourceforge.net/svnroot/supercollider/trunk/common/Source/
_svnmod3=Source

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  
  if [ -d $_svnmod2/.svn ]; then
    (cd $_svnmod2 && svn up)
  else
    svn co $_svntrunk2 --config-dir ./ 
  fi

  msg "SVN checkout done or server timeout"
  
  if [ -d $_svnmod3/.svn ]; then
    (cd $_svnmod3 && svn up)
  else
    svn co $_svntrunk3 --config-dir ./ 
  fi


  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  scons PREFIX=/usr SC3PATH=$srcdir/ || return 1
  scons DESTDIR=$pkgdir/ install || return 1

  rm -rf $srcdir/$_svnmod-build
}
# vim:syntax=sh
