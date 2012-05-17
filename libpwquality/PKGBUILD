pkgname=libpwquality
pkgver=1.0.0
pkgrel=2
pkgdesc="A library for password generation and password quality checking"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/libpwquality/"
license=('GPL2')
depends=('python2' 'cracklib' 'pam>=1.1.5-3')
options=('!libtool')
source=("https://fedorahosted.org/releases/l/i/$pkgname/$pkgname-$pkgver.tar.bz2")
backup=('etc/security/pwquality.conf')
md5sums=('35e809791aedcbedfb3bd33f1a715984')
sha256sums=('1f2e6171071f37871096c9d73f91ac4f2d35597ba844d07594e080c37b15009c')

build() {

  cd "$srcdir/$pkgname-$pkgver"

  # This build barely makes it without any sed/patching.

  export PYTHON=python2
  export PYTHONREV=$(python2 -c 'import sys;print "%s.%s" % (sys.version_info[0], sys.version_info[1])')
  export PYTHONSITEDIR="/usr/lib/python$PYTHONREV/site-packages"

  LDFLAGS+=" -Wl,--no-undefined"

  autoreconf -fiv

  ./configure --prefix=/usr \
    --libdir=/usr/lib \
    --disable-static \
    --with-pythonrev="$PYTHONREV" \
    --with-pythonsitedir="$PYTHONSITEDIR"

  make -C src

  cd python
  python2 setup.py build --build-lib=

}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
