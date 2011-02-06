# Contributor: William Rea <sillywilly@gmail.com>
pkgname=python-kenosis
pkgver=0.96
pkgrel=1
pkgdesc="A fully-distributed p2p RPC system built on top of XMLRPC"
url="http://kenosis.sourceforge.net"
license="MIT"
depends=('python')
source=(http://dl.sourceforge.net/sourceforge/kenosis/kenosis-$pkgver.tar.gz)
md5sums=('6a3a2721061c73918aa43020a0705e0e')

build() {
  cd $startdir/src/kenosis-$pkgver
  python kenosis_setup.py install --root=$startdir/pkg

  install -D bt/LICENSE.txt $startdir/pkg/usr/share/licenses/$pkgname/LICENSE.txt
}
