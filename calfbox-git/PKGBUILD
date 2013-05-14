# Maintainer: boltbuckle <eli--at--drilboor--dot--com>

pkgname=calfbox-git
pkgver=20130403
pkgrel=1
pkgdesc="Open source music instrument"
arch=('i686' 'x86_64')
url="http://repo.or.cz/w/calfbox.git"
license=('GPL')
makedepends=('git')
depends=('glib2' 'libsmf' 'fluidsynth' 'libsndfile' 'libusb-compat' 'util-linux' 'jack' 'python')
options=()
source=()
md5sums=()

_gitroot="http://repo.or.cz/r/calfbox.git"
_gitname="calfbox"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  
  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # Configure and BUILD 
  ./autogen.sh
  ./configure prefix=/usr
  make 
  
  #Build Python module
  python setup.py build
  make 
  msg "Building Python module..."
}   
  
  #Install Python module
package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  python setup.py install --root="$pkgdir/" --optimize=1
}


