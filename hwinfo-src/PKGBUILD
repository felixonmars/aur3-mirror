pkgname=hwinfo-src
pkgver=21.7.1.1
pkgrel=1
pkgdesc='Hardware detection tool from openSUSE'
arch=('x86_64' 'i686' 'armv7h')
url='http://download.opensuse.org/source/factory/repo/oss/suse/src/'
license=('GPL2')
depends=('libx86emu-src' 'bash' 'perl')
makedepends=('sysfsutils' 'flex')
conflicts=('hwinfo')
options=('!emptydirs')
source=("http://download.opensuse.org/source/factory/repo/oss/suse/src/hwinfo-${pkgver%.*.*}-${pkgver#*.*.}.src.rpm")
sha256sums=('847c2cd52ef7469411625fc25f771d4ccc0a817c2c9c54e181a278afc9942909')

prepare() {
  tar Jxf "hwinfo-${pkgver%.*.*}.tar.xz"
}

build() {
  make -C "hwinfo-${pkgver%.*.*}" -j1 \
    CFLAGS+="-fPIC -I$srcdir/hwinfo-${pkgver%.*.*}/src/hd" \
    LIBDIR=/usr/lib
}

package() {
  make -C "hwinfo-${pkgver%.*.*}" LIBDIR=/usr/lib DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}

