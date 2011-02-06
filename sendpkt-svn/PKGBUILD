# Contributor: andelf <andelf@gmail.com>
pkgname=sendpkt-svn
pkgver=56
pkgrel=1
pkgdesc="Yet Another Python extension module for libpcap. \
Send ethernet frame in Linux or Win32."
url="http://code.google.com/p/sendpkt/"
license=('Apache License 2.0')
arch=('i686')
depends=('python2' 'libpcap')
makedepends=('python2' 'libpcap' 'subversion')
_svntrunk=http://sendpkt.googlecode.com/svn/trunk/
_svnmod=sendpkt
source=()
md5sums=()

build() {
  cd $startdir/src/
  msg 'SVN checking out...'
  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  cd $_svnmod
  msg "SVN checkout done or server timeout"
  msg "Building..."
  python2 setup.py build
  python2 setup.py install --root=$startdir/pkg
}
