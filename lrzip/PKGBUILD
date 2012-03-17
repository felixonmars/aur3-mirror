#Maintainer: graysky <graysky AT archlinux DOT us>
#Contributor: kastor@fobos.org.ar
pkgname=lrzip
pkgver=0.612
pkgrel=1
pkgdesc="A multi-threaded compression program which uses the rzip/lzma, lzo, and zpaq compression algorithms."
url="http://lrzip.kolivas.org/"
license="GPL"
arch=('i686' 'x86_64')
depends=('lzo2' 'bzip2' 'zlib')
[[ $CARCH == i686 ]] && depends+=('nasm')
source=(http://ck.kolivas.org/apps/$pkgname/$pkgname-$pkgver.tar.bz2)
sha256sums=('2c309fb40766207f1deeb09e2431ae34db7e6d7a22d713c25efcc84ed8c52e97')

build() {
  CFLAGS="${CFLAGS} -fomit-frame-pointer"
  CXXFLAGS="${CXXFLAGS} -fomit-frame-pointer"

  cd "$srcdir/$pkgname-$pkgver"

 if [[ $CARCH == i686 ]];then
      ./autogen.sh --prefix=/usr --enable-asm
  else
      ./autogen.sh --prefix=/usr
  fi

  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install-strip
}
