# Contributor: Gleb Javorsky <javorsky.gleb@gmail.com>
pkgname=kaa-svn
pkgver=4298
pkgrel=2
pkgdesc="Media framework for Freevo"
url="http://doc.freevo.org/2.0/Kaa"
license="GPL"
arch=('i686' 'x86_64')
depends=()
makedepends=('python')
provides=('kaa')
conflicts=('kaa-base' 'kaa-display' 'kaa-imlib2' 'kaa-metadata')
replaces=()
backup=()
install=

_svntrunk=svn://svn.freevo.org/kaa/trunk
_svnmod=kaa

build() {

  cd $startdir/src/
  svn co $_svntrunk $_svnmod
  cd $_svnmod
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  
  python setup.py build
  python setup.py install --prefix=$startdir/pkg/usr
}

