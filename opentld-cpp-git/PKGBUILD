# Maintainer: hi117 <hi117IRC[at]gmail.com>

pkgname=opentld-cpp-git
pkgver=20120929
pkgrel=1
pkgdesc="Object Tracking System"
arch=('i686' 'x86_64')
url="http://gnebehay.github.com/OpenTLD/"
license=('GPL')
depends=('glibc' 'opencv')
makedepends=('git' 'gcc' 'cmake')
conflicts=('')
provides=("") 

_gitroot="git://github.com/gnebehay/OpenTLD"
_gitname="OpenTLD"

build() {
  cd $srcdir
  msg "Connecting to the Git repository..."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
  else
    git clone $_gitroot
  fi
  
  msg "Git clone done"
  msg "Starting make..."
  
  rm -rf $srcdir/$_gitname-build
  git clone $srcdir/$_gitname $srcdir/$_gitname-build
  
  cd "$srcdir/$_gitname"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" ..
  make
}

package() {
  cd "$srcdir/$_gitname/build"
  mkdir -p "$pkgdir/usr/"
  make install
  rm -rf "$srcdir/$_gitname/build"
}
