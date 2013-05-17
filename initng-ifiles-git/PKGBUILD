# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=initng-ifiles-git
_gitname="initng-ifiles"
pkgver=129.2348600
pkgrel=1
pkgdesc="A full replacement for the old System V Init system"
arch=('i686' 'x86_64')
url="http://initng.sourceforge.net/trac"
license=('GPL2')
depends=('initng-git')
makedepends=('git' 'acr' 'ftjam')
options=(!strip)
source=(git://github.com/initng/${_gitname}.git)
md5sums=(SKIP)

pkgver() {
    cd $_gitname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  rm -rf $srcdir/build #start fresh
  cp -ar $srcdir/${_gitname} $srcdir/build
  cd $srcdir/build
  CFLAGS="${CFLAGS} $(pkg-config --cflags initng) -DINITNG_PLUGIN_DIR='/lib/initng'"
  cmake . 
  make
}

package() {
 cd $srcdir/build
 make install DESTDIR=$pkgdir
 mkdir -p $pkgdir/usr/share/licenses/initng
 cp $srcdir/build/COPYING $pkgdir/usr/share/licenses/initng/
 cp $srcdir/build/AUTHORS $pkgdir/usr/share/licenses/initng/
}
