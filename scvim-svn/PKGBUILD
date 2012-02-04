# Contributor: Renato Budinich rennabh ET gmail DOP com
pkgname=scvim-svn
pkgver=9856
pkgrel=1
pkgdesc="supercollider  interaction scripts and syntax highlighting for vim"
arch=('i686' 'x86_64')
url="http://x37v.info/scvim/"
license=('GPL3')
depends=('supercollider-svn' 'vim' 'ruby' 'links' 'unrtf')
makedepends=('scons' 'svn')
source=()
install='scvim-svn.install'

_svnmod="scvim"
_svntrunk="https://supercollider.svn.sourceforge.net/svnroot/supercollider/trunk/editors/scvim "



build() {


  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    msg "Connecting to $_svnmod SVN server...."
  fi

  msg "SVN checkout done or server timeout"

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  #small patch needed for scvim_make_help to work
  patch -p1 bin/scvim_make_help $startdir/scvim_make_help.patch 

  mkdir -p $startdir/pkg/usr/bin 
  mkdir -p $startdir/pkg/usr/share/vim/vim72/ftplugin
  mkdir -p $startdir/pkg/usr/share/vim/vim72/syntax
  mkdir -p $startdir/pkg/usr/share/vim/vim72/indent 
  mkdir -p $startdir/pkg/usr/share/scvim
  mkdir -p $startdir/pkg/usr/share/SuperCollider/Extensions/scvim

  cp -r bin/* $startdir/pkg/usr/bin/
  cp -r ftplugin/* $startdir/pkg/usr/share/vim/vim72/ftplugin/
  cp -r syntax/* $startdir/pkg/usr/share/vim/vim72/syntax/
  cp -r indent/* $startdir/pkg/usr/share/vim/vim72/indent/
  cp    scvimrc $startdir/pkg/usr/share/scvim/scvimrc
  cp -r scclasses $startdir/pkg/usr/share/SuperCollider/Extensions/scvim

  rm -rf $startdir/src/$_svnmod-build
}

# vim:set ts=2 sw=2 et:
