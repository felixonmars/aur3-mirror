
# Maintainer: Alex Jones <jonesax@hush.com>
# Contributor: Dragan Glumac <dragan.glumac@gmail.com
pkgname=jnxlibc
pkgver=1.4
pkgrel=1
pkgdesc="General purpose C library with many useful components"
arch=('any')
url="http://github.com/AlexsJones/jnxlibc"
license=('GPL')
groups=('base-devel')
depends=('glibc' 'doxygen')
options=()
source=("https://github.com/AlexsJones/jnxlibc/archive/${pkgver}.tar.gz")
md5sums=('e00949207b0d9d17c7626e2b3b3bac84')
build() {
  cd $srcdir/${pkgname}-${pkgver}
  cd platform/linux
  ./configure
  make
}

package() {
  cd $srcdir/${pkgname}-${pkgver}/platform/linux
  mkdir -p "$pkgdir/usr"
  mkdir -p "$pkgdir/usr/include/"
  mkdir -p "$pkgdir/usr/lib/"
  mkdir -p "$pkgdir/usr/share/man/man3"
  cp lib/libjnxc.so.1.0 "$pkgdir/usr/lib"
  cp -rf lib/jnxc_headers "$pkgdir/usr/include"
  ln -sf "$pkgdir/usr/lib/libjnxc.so.1.0" "$pkgdir/usr/lib/libjnxc.so"
  ln -sf "$pkgdir/usr/lib/libjnxc.so.1.0" "$pkgdir/usr/lib/libjnxc.so.1"
}
