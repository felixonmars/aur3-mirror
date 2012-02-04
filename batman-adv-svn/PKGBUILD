# Contributor: Sven 'pfleidi' Pfleiderer <sven @ roothausen.de>
pkgname=batman-adv-svn
pkgver=1622
pkgrel=1
pkgdesc="Batman-advanced is a new approach to wireless networking"
arch=('i686' 'x86_64')
url="http://www.open-mesh.net/"
license=('GPL')
install=('batman-adv.install')
source=()
makedepends=('subversion')
depends=('kernel26-headers' 'batctl-svn')
md5sums=()

_svntrunk="http://downloads.open-mesh.net/svn/batman/trunk/batman-adv-kernelland/"
_svnmod="batman-adv-kernelland"

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
  svn export $_svnmod $_svnmod-build
  cd $_svnmod-build
  make || return 1
  #install the module in the pkgdir (make install has doesn't support PREFIX, boo.)
  install -D -m 644 batman-adv.ko $pkgdir/lib/modules/`uname -r`/misc/batman_adv.ko || return 1
  install -D -m 644 README $pkgdir/usr/share/doc/batman-adv/README
}

# vim:set ts=2 sw=2 et:

