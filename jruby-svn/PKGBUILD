# $Id$
# Maintainer: Michael Fellinger <manveru@sigma.localdomain>
pkgname=jruby-svn
pkgver=3938
pkgrel=1
pkgdesc="JRuby is an 100% pure-Java implementation of the Ruby programming language."
url="http://jruby.codehaus.org/"
license="CPL/GPL/LGPL"
arch=('x86_64' 'i686')
depends=(jdk)
makedepends=(cvs apache-ant)
conflicts=()
replaces=()
backup=()
install=
source=(jruby.profile jruby-1157.patch)
md5sums=('a29e92de5b503fe9c237c27bde56359a' '9ef675949da29f0e9e2255f25fb5b873')

_svntrunk="http://svn.codehaus.org/jruby/trunk/jruby"
_svnmod="jruby"

build() {
	cd $startdir/src

  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  cd $_svnmod
  patch -Np0 -i ${startdir}/jruby-1157.patch

  msg "SVN checkout done or server timeout"
  msg "Starting copying and ant..."

  mkdir -p $startdir/pkg/opt/jruby
  export JRUBY_HOME=$startdir/pkg/opt/jruby
  cp -r * $JRUBY_HOME
  cd $startdir/pkg/opt/jruby
  ant test || return 1
}
