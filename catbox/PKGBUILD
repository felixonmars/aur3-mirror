pkgname=catbox
pkgver=20111108
pkgrel=3
pkgdesc="A sandbox from Pardus project"
arch=('i686')
url='http://www.pardus.org.tr'
license=('GPL')
depends=('python2')
makedepends=('subversion')

_svnroot="http://svn.pardus.org.tr/uludag/trunk/catbox/"

build() {
  cd "$srcdir"
  msg "Connecting to Subversion server...."

  svn checkout $_svnroot

  msg "SVN checkout done or server timeout"
}

package() {
  cd "$srcdir/catbox"

  python2 setup.py build
  mkdir -p $pkgdir/usr/lib/python2.7/site-packages
  cp build/lib.linux-i686-2.7/catbox.so $pkgdir/usr/lib/python2.7/site-packages/catbox.so
}

