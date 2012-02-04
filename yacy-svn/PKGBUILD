# Contributor: Florian Richter <Florian_Richter@gmx.de>
pkgname=yacy-svn
pkgver=7711
pkgrel=1
pkgdesc="Peer to peer searchengine"
arch=(i686 x86_64)
url="http://yacy.net/"
license="GPL"
depends=('java-runtime' 'sudo')
makedepends=('java-environment' 'apache-ant' 'subversion' 'm4')
conflicts=(yacy)
replaces=()
provoids=(yacy)
install=yacy.install
source=()
md5sum=()

_svntrunk=svn://svn.berlios.de/yacy/trunk/
_svnmod=yacy

build() {
  cd $startdir/src/
  msg "Checking out svn-tree..."
  svn co -r $pkgver $_svntrunk $_svnmod || return 1
  cd $startdir/src/yacy/

  msg "Create working directory"
  cp -r $startdir/src/yacy $startdir/src/yacy-work
  rm -rf $(find "$startdir/src/yacy-work" -type d -name ".svn" -print)
  # svn-file, that buildscript can determine revision
  mkdir -p $startdir/src/yacy-work/.svn/
  cp $startdir/src/yacy/.svn/entries $startdir/src/yacy-work/.svn/entries
  cd $startdir/src/yacy-work/

  msg "compile and copy files..."
  ant all installonlinux -DDESTDIR=$startdir/pkg || return 1
  mkdir -p $startdir/pkg/usr/share/java/yacy/
  cp lib/*.jar $startdir/pkg/usr/share/java/yacy/
  mkdir -p $startdir/pkg/etc/rc.d
  m4 -DArchLinux $startdir/src/yacy/addon/yacyInit.m4 >yacy.init || return 1
  install -Dm755 yacy.init $startdir/pkg/etc/rc.d/yacy

  msg "Delete working directory"
  rm -rf $startdir/src/yacy-work
}
