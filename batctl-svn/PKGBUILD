# Contributor: Sven 'pfleidi' Pfleiderer <sven @ roothausen.de>
pkgname=batctl-svn
pkgver=1641
pkgrel=1
pkgdesc="B.A.T.M.A.N. advanced control and management tool"
arch=('i686' 'x86_64')
url="http://www.open-mesh.net/"
license=('GPL')
install=()
source=()
makedepends=('subversion')
md5sums=()

_svntrunk="http://downloads.open-mesh.net/svn/batman/trunk/"
_svnmod="batctl"

build() {
  cd $startdir/src
  msg "Connecting to SVN server...."
  
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  [ -d $_svnmod-build ] && rm -r $_svnmod-build
  svn export $_svnmod $_svnmod-build
  cd $_svnmod-build/batctl
  make || return 1
  install -D -m 700 batctl $pkgdir/usr/sbin/batctl || return 1
  install -D -m 644 README $pkgdir/usr/share/doc/$pkgname/README
  install -D -m 644 bat-hosts.sample $pkgdir/usr/share/doc/$pkgname/bat-hosts.sample
}

# vim:set ts=2 sw=2 et:

