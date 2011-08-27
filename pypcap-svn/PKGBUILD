# Contributor: andelf <andelf@gmail.com>
pkgname=pypcap-svn
pkgver=102
pkgrel=3
pkgdesc="Python extension module for libpcap. \
This is a svn version."
url="http://code.google.com/p/pypcap/"
license=('BSD')
arch=('i686')
depends=('python2' 'libpcap')
makedepends=('python2' 'libpcap' 'pyrex' 'subversion')
conflicts=('pypcap')
provides=('pypcap')
_svntrunk=http://pypcap.googlecode.com/svn/trunk
_svnmod=pypcap
source=()
md5sums=()

build() {
  cd $startdir/src/
  msg 'SVN checking out...'
  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  cd $_svnmod
  msg "SVN checkout done or server timeout"
  msg "Config libpcap path..."
  python2 setup.py config
  msg "Running pyrexc on `pcap.pyx`..."
  pyrexc pcap.pyx
  msg "Building..."
  python2 setup.py build
  python2 setup.py install --root=$startdir/pkg
}
