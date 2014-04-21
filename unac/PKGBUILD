# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Steven Allen <steven@stebalien.com>

pkgname=unac
pkgver=1.7.0
pkgrel=2
pkgdesc='C Library to remove accents from strings'
arch=('x86_64' 'i686')
depends=('glibc')
url='https://savannah.nongnu.org/projects/unac/'
license=('GPL')
options=('!libtool')
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz"
        "unactest1.patch")
sha512sums=('703d8042aba698407087deead29df6bef4deb778107a6ca6542eda31ff2a0de3933413469f95cf411e72d3cc00e4d1598e1cb102beac3dcd12dbe961bc707313'
            '25fc7b8e429c21dd64db34644adcaa73bc205c63441afb12d2018a569e0b80d9e22248cffe602bedb3b31af0e66e3c389707f3c1b664d8f0931dd838af5cbd49')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -i "$srcdir/unactest1.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
