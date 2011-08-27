# Contributor: Gleb Javorsky <javorsky.gleb@gmail.com>
pkgname=kaa-svn-r4366
pkgver=4366
pkgrel=2
pkgdesc="Media framework for Freevo"
url="http://doc.freevo.org/2.0/Kaa"
license="GPL"
arch=('i686' 'x86_64')
depends=()
makedepends=('python')
provides=('kaa' 'kaa-svn')
conflicts=('kaa-base' 'kaa-display' 'kaa-imlib2' 'kaa-metadata' 'kaa-svn')
source=('setup.py.patch')
md5sums=('284ad2f587f3ca87dd50dead71bef04e')


build() {

  cd $startdir/src/
  svn co -r 4366 svn://svn.freevo.org/kaa/trunk kaa
  
  cd kaa
  patch < $startdir/setup.py.patch
  
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  
  python2 setup.py build
  python2 setup.py install --prefix=$startdir/pkg/usr
}

