# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=mediastreamer-plugin-msilbc
pkgver=2.0.3
pkgrel=1
pkgdesc="iLBC support for mediastreamer-based applications"
arch=('i686' 'x86_64')
url="http://www.linphone.org"
license=('GPL')
depends=('mediastreamer' 'ilbc')
source=(http://download.savannah.gnu.org/releases/linphone/plugins/sources/msilbc-$pkgver.tar.gz)
md5sums=('9c8740345dd8ee9732604a8f6a4329e6')

build() {
  cd "$srcdir/msilbc-$pkgver"
  ILBC_CFLAGS="-I/usr/include/ilbc" ILBC_LIBS="ilbc" \
  ./configure --prefix=/usr --libexecdir=/usr/lib/mediastreamer/
  make
}

check() {
  cd "$srcdir/msilbc-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/msilbc-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
