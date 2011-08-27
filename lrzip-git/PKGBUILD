# Maintainer: Raghavendra Prabhu 'tlonim' < raghu . prabhu13 AT gmail dot com >

pkgname=lrzip-git
pkgver=20110310
pkgrel=1
pkgdesc="Lzma RZIP by Con Kolivas"
arch=('i686' 'x86_64')
url="http://github.com/ckolivas/lrzip"
license=('GPL')
provides=('lrzip')
conflicts=('lrzip')
makedepends=('git')

depends=('lzo2' 'bzip2' 'zlib')
[[ $CARCH == i686 ]] && depends+=('nasm')

_gitroot="git://github.com/ckolivas/lrzip"
_gitname="lrzip"

build() {
  cd "$srcdir"

  if [ -d $_gitname ] ; then
    (cd $_gitname && git pull origin) || warning "Git pull failed!"
  else
    git clone $_gitroot $_gitname
  fi

  rm -rf $_gitname-build
  git clone "$srcdir/$_gitname" $_gitname-build
  cd $_gitname-build

  # CFLAGS recommended by developer 
  CFLAGS="${CFLAGS/-O2/-O3} -fomit-frame-pointer"
  CXXFLAGS="${CXXFLAGS/-O2/-O3} -fomit-frame-pointer"
 
  if [[ $CARCH == i686 ]];then
      ./autogen.sh --prefix=/usr --enable-asm
  else
      ./autogen.sh --prefix=/usr
  fi

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
