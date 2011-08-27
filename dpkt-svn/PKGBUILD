# Maintainer: Ruben Schuller <r.schuller@orgizm.net>
# Contributor: fnord0 

pkgname=dpkt-svn
pkgver=82
pkgrel=2
pkgdesc="fast, simple packet creation / parsing module for python, with definitions for the basic TCP/IP protocols."
arch=('i686' 'x86_64' 'ppc')
provides=('dpkt')
license=('BSD')
url="http://code.google.com/p/dpkt/"
depends=('python2')
makedepends=('subversion')
source=()
md5sums=()
_svntrunk=http://dpkt.googlecode.com/svn/trunk 
_svnmod=dpkt-read-only

build() {
  cd $startdir/src
  msg "Updating dpkt SVN..."
  svn co $_svntrunk -r $pkgver $svnmod
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  cd $startdir/src/trunk
  python2 setup.py install --prefix=$startdir/pkg/usr
  }
