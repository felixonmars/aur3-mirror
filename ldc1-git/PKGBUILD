# Maintainer: Marenz <aur at supradigital dot org>

pkgname=ldc1-git
pkgver=20120810
pkgrel=1
pkgdesc="A LLVM based compiler for the D programming language"
arch=('i686' 'x86_64')
url="http://ldc-developers.github.com/ldc"
license=('BSD' 'GPL')
depends=('libconfig' 'llvm>=3.1')
makedepends=('git')
provides=('ldc1')
backup=('etc/ldc.conf'  'etc/ldc.rebuild.conf')
options=('!emptydirs makeflags')
source=('ldc.conf')

_gitroot=https://github.com/ldc-developers/ldc.git
_gitname=ldc

build() {
  cd "$srcdir"

  msg "Connecting to GIT repository $_gitroot..."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname #&& git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  msg "Creating cmake build directory..."
  if [ ! -d build ]; then mkdir build; fi
  cd build && cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DD_VERSION=1 ..

  msg "Now building..."
  make 
}

package() {
  cd "$srcdir/$_gitname/build"
  make DESTDIR="$pkgdir" install

	if [ ! -d $pkgdir/etc]; then mkdir $pkgdir/etc; fi
	cp $srcdir/ldc.conf $pkgdir/etc/ldc.conf
}
md5sums=('3a7ff1d6b80c724cc0e52a385847f13c')
