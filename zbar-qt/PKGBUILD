# Contributor: Radu Andries <admiral0@tuxfamily.org>

pkgname=zbar-qt
pkgver=0.10
pkgrel=2
pkgdesc="An open source software suite for reading bar codes from various sources"
arch=('i686' 'x86_64')
url="http://zbar.sourceforge.net/"
license=('LGPL')
depends=(qt4 imagemagick libxv v4l-utils)
provides=()
source=("http://downloads.sourceforge.net/project/zbar/zbar/$pkgver/zbar-$pkgver.tar.bz2")
md5sums=('0fd61eb590ac1bab62a77913c8b086a5')

prepare() {
  cd "$srcdir/zbar-$pkgver"
  sed -i -e 's|linux/videodev.h|libv4l1-videodev.h|g' configure{,.ac} zbar/video/v4l?.c
  cat >zbar/debug.h <<EOF
static inline const unsigned char *dsprintbuf(void *ean)
{
    return "ndebug";
}

#define zassert(condition, retval, format, ...) do{}while(0)
EOF
}

build() {
  cd "$srcdir/zbar-$pkgver"
  ./configure --prefix=/usr --without-gtk --without-python
  make
}

package() {
  cd "$srcdir/zbar-$pkgver"
  make DESTDIR="$pkgdir/" install
}
