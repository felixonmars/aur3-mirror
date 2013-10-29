
pkgname=kissfft
pkgver=1.3.0
pkgrel=1
pkgdesc="Fast Fourier Transform based up on the principle, Keep It Simple, Stupid."
arch=('i686' 'x86_64')
url="http://kissfft.sourceforge.net/"
license=('BSD')
depends=('gcc-libs')
makedepends=()
options=()
source=("http://downloads.sourceforge.net/project/kissfft/kissfft/v1_3_0/kiss_fft130.zip")
md5sums=('b91b85ca92001f4598e5a8c4bd476412')

build() {
  cd "$srcdir/kiss_fft130"
  gcc -o kiss_fft.o -c kiss_fft.c -fPIC $CPPFLAGS $CFLAGS
  gcc -shared -o libkiss_fft.so kiss_fft.o $CPPFLAGS $LDFLAGS  
}

package() {
  cd "$srcdir/kiss_fft130"
  install -d "$pkgdir"/usr/include/
  install -m644 kissfft.hh kiss_fft.h "$pkgdir"/usr/include/
  install -d "$pkgdir"/usr/lib
  install -m755 libkiss_fft.so  "$pkgdir"/usr/lib/
}

