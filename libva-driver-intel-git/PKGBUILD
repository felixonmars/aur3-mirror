# Maintainer: trya <tryagainprod@gmail.com>

pkgname=libva-driver-intel-git
pkgver=20120219
pkgrel=1
pkgdesc="VA API driver for Intel graphic chips"
arch=('i686' 'x86_64')
license=('MIT')
url="http://www.freedesktop.org/wiki/Software/vaapi"
makedepends=('git')
depends=('libva')
conflicts=('libva-driver-intel')
options=(!libtool)
source=()
md5sums=()

_gitroot="git://anongit.freedesktop.org/vaapi/intel-driver"
_gitname="intel-driver"
_g45support=0 # anything but 0 enables support for G45 chips

build() {
  cd "$srcdir"
  
  msg "Connecting to git.freedesktop.org GIT server..."
  if [ -d $_gitname ] ; then
    rm -rf $_gitname
  fi

  if [ $_g45support = 0 ]; then
    git clone $_gitroot
  else
    msg "Building intel-driver with G45 support"
    mkdir $_gitname
    cd $_gitname
    git init
    git remote add -t g45-h264 -f origin $_gitroot
    git checkout g45-h264
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir"
  rm -rf $_gitname-build
  cp -r $_gitname $_gitname-build
  cd $_gitname-build

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
