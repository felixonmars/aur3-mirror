# Maintainer: Alf <naihe2010@126.com>

pkgname=acnchess
pkgver=0.0.3
pkgrel=1
pkgdesc="another Chinese chess game coded by Alf"
arch=('i686' 'x86_64')
url='http://naihe2010.github.com/acnchess/index.html'
license=('GPLv2')
depends=('gtk2>=2.6.0' 'openssl>=0.9.8')
makedepends=('git' 'cmake')
source=('https://github.com/naihe2010/acnchess/zipball/v0.0.3')
_sourcedir=naihe2010-$pkgname-4eb2312
options=(!buildflags)
md5sums=('73d0dfd490cd668e94f7147b98146d2b')

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
