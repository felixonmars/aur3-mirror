# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# $Id$
pkgname=swocket
pkgver=0.1pre2
pkgrel=1
pkgdesc="A cross-platform modular XML Socket server framework implemented in Python with the intention of being used to communicate with Macromedia® Flash® 5 content but is easily usable with other platforms that support the same flavor of XML Sockets"
url="http://swocket.sourceforge.net/"
license=("BSD")
depends=('python')
arch=(i686 x86_64)
makedepends=('python')
source=("http://downloads.sourceforge.net/sourceforge/swocket/swocket-$pkgver.zip")
md5sums=('3007ca474a2a78c6e60949c00d42653c')



build() {
  cd $startdir/src/$pkgname
  python setup.py install --root=$startdir/pkg/
}

