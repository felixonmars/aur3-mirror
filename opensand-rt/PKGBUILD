# Maintainer: Audric Schiltknecht <storm+arch@chemicalstorm.org>
pkgname=opensand-rt
pkgver=3.0.0
pkgrel=1
pkgdesc="The runtime library for OpenSAND"
arch=('i686' 'x86_64')
url="http://www.opensand.org"
license=('GPL3')
groups=('opensand')
depends=('opensand-output' 'gperftools')
source=("https://launchpad.net/opensand/3.0.x/${pkgver}/+download/opensand-${pkgver}.tar.gz"
        "opensand-rt.patch")
md5sums=('1e62f66c17397f778d58f79fb42b2564'
         '245ebbe6fce910105db0b2b6d165dc28')

prepare() {
  cd "$srcdir/opensand-$pkgver"
  tar xf $pkgname-$pkgver.tar.gz
  cd "$pkgname-$pkgver"
  patch -p1 < $srcdir/opensand-rt.patch
}

build() {
  cd "$srcdir/opensand-$pkgver/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/opensand-$pkgver/$pkgname-$pkgver"
#  make -k check
}

package() {
  cd "$srcdir/opensand-$pkgver/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
