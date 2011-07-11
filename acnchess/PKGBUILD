# Maintainer: Alf <naihe2010@126.com>

pkgname=acnchess
pkgver=0.0.2
pkgrel=1
pkgdesc="another Chinese chess game coded by Alf"
arch=('i686' 'x86_64')
url='http://naihe2010.github.com/acnchess/index.html'
license=('GPLv2')
depends=('gtk2>=2.6.0' 'openssl>=0.9.8')
makedepends=('git' 'cmake')
source=('https://github.com/naihe2010/acnchess/zipball/v0.0.2')
_sourcedir=naihe2010-$pkgname-2da52bc
options=(!buildflags)
md5sums=('c1803dc5a0f98741bc9158f07bf4cabd')

build() {
  cd "$srcdir/$_sourcedir/libs"
  if [ -d libttdht/.git ]; then
    cd libttdht && git pull origin
  else
    git clone http://github.com/naihe2010/libttdht.git --depth=1
  fi

  cd "$srcdir/$_sourcedir"
  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/$_sourcedir/build"
  make DESTDIR="$pkgdir/" install

  make clean
}
