# Contributor: Marius Dransfeld <marius.dransfeld@googlemail.com>
pkgname=jme-svn
_realname=jme
pkgver=4848
pkgrel=2
pkgdesc="jMonkey Engine (jME) is a high-performance 3D game engine, written entirely in Java"
arch=('i686' 'x86_64')
url="http://www.jmonkeyengine.com/"
license=('BSD')
depends=('java-environment')
makedepends=('subversion' 'apache-ant')
provides=($_realname)
conflicts=($_realname)


_svntrunk=http://jmonkeyengine.googlecode.com/svn/trunk/
_svnmod=jmonkeyengine

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

  #
  # BUILD
  #
  ant doc dist-all || return 1
  mkdir -p $pkgdir/usr/share/java/$_realname/lib
  cp -r lib/* $pkgdir/usr/share/java/$_realname/lib/
  cp target/*.jar $pkgdir/usr/share/java/$_realname/
  
  msg "copy docs"
  mkdir -p $pkgdir/usr/share/doc/$_realname
  cp -r data/doc/* $pkgdir/usr/share/doc/$_realname/

  msg "remove native libraries"
  cd $pkgdir/usr/share/java/$_realname/lib/jogl/native
  rm -rf macosx
  rm -rf solaris_i586
  rm -rf windows_amd64
  rm -rf windows_i586
  if [ `uname -m` = 'x86_64' ]; then
    rm -rf linux_i586
  else
    rm -rf linux_amd64
  fi

  cd $pkgdir/usr/share/java/$_realname/lib/lwjgl/native
  rm -rf windows
  rm -rf macosx
  rm -rf solaris
  cd linux
  if [ `uname -m` = 'x86_64' ]; then
    rm -f libjinput-linux.so
    rm -f liblwjgl.so
    rm -f libopenal.so
  else
    rm -f *64.so
  fi 

  

}
