# Maintainer: mjheagle8 <mjheagle8@gmail.com>

pkgname=python-musicbrainz
pkgver=12709
pkgrel=1
pkgdesc="python bindings for the MusicBrainz client library"
depends=('musicbrainz' 'python-ctypes')
makedepends=('subversion')
arch=('any')
source=()
md5sums=()
url="http://www.musicbrainz.org/index.html"
license="LGPL"

_svntrunk=http://svn.musicbrainz.org/python-musicbrainz2/trunk
_svnmod=python-musicbrainz2

build() {
  cd $srcdir

  #check out code
  svn co $_svntrunk $_svnmod -r $pkgver

  #copying files
  echo "Copying files..."
  cd $srcdir/$_svnmod
  python setup.py install --root=$pkgdir
}
