# Contributor: Marius Dransfeld <marius.dransfeld@googlemail.com>
# Contributor: Sietse van der Molen <sietse@vdmolen.eu> 
pkgname=jme-svn
_realname=jme
pkgver=9671
pkgrel=2
pkgdesc="The high-performance 3D game engine jMonkey Engine (jME). Engine only, no SDK."
arch=('i686' 'x86_64')
url="http://www.jmonkeyengine.com/"
license=('BSD')
depends=('java-environment' 'jogl' 'lwjgl')
makedepends=('subversion' 'apache-ant')
provides=($_realname)
conflicts=($_realname)


_svntrunk=http://jmonkeyengine.googlecode.com/svn/trunk/engine
_svnmod=jme3

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
  # BUILD ENGINE
  #
  ant jar || return 1

  # Copy libs
  msg "Copying libs"
  mkdir -p $pkgdir/usr/share/java/$_realname/lib
  cp -r dist/lib/* $pkgdir/usr/share/java/$_realname/lib/

  #
  # BUILD JAVADOC
  #
  ant javadoc || return 1

  # Copy javadoc
  msg "Copying javadoc"
  mkdir -p $pkgdir/usr/share/doc/$_realname
  cp -r dist/javadoc/* $pkgdir/usr/share/doc/$_realname/
}
