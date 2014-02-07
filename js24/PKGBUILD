# Maintainer: Yosef Or Boczko <yoseforb@gmail.com>

pkgname=js24
pkgver=24.2.0
pkgrel=1
pkgdesc="JavaScript interpreter and libraries"
arch=(i686 x86_64)
url="https://developer.mozilla.org/En/SpiderMonkey/17"
license=(MPL)
depends=(nspr gcc-libs libffi readline)
makedepends=(python2 zip)
options=(!staticlibs)
source=(http://ftp.mozilla.org/pub/mozilla.org/js/mozjs-$pkgver.tar.bz2)
md5sums=('5db79c10e049a2dc117a6e6a3bc78a8e')

build() {
  unset CPPFLAGS
  cd mozjs-$pkgver/js/src
  ./configure --prefix=/usr --with-system-nspr --with-system-ffi \
     --enable-readline --enable-threadsafe
  make
}

check() {
  cd mozjs-$pkgver/js/src
  make check
}

package() {
  cd mozjs-$pkgver/js/src
  make DESTDIR="$pkgdir" install
  find "$pkgdir"/usr/{lib/pkgconfig,include} -type f -exec chmod -x {} +
}

# vim:set ts=2 sw=2 et:
