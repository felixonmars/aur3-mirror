# Maintainer : alf500 <hammerm98 [at] googlemail [dot] com>

pkgname=ejabberd-xmlrpc-svn
pkgver=1122
pkgrel=1
pkgdesc="ejabberd_xmlrpc is an ejabberd listener that starts a XML-RPC server and waits for external calls."
arch=(any)
url="http://www.ejabberd.im/ejabberd_xmlrpc"
license=('unknown')
depends=('ejabberd' 'erlang-xmlrpc')
makedepends=('erlang' 'subversion' 'erlang-xmlrpc')
options=()

_svntrunk=https://svn.process-one.net/ejabberd-modules
_svnmod=ejabberd-modules
md5sums=()

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  [ -d $srcdir/$_svnmod-build ] && rm -r $srcdir/$_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  #
  # BUILD
  #
  cd ejabberd_xmlrpc/trunk

  ./build.sh

  rm -rf ebin/.svn
  install -d -m 0755 $pkgdir/usr/lib/ejabberd
  cp -r ebin $pkgdir/usr/lib/ejabberd/ebin
}
