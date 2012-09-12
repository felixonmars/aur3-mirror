# Maintainer: Audric Schiltknecht <storm+arch@chemicalstorm.org>
pkgname=opensand-env-plane
pkgver=0.9.0
pkgrel=1
pkgdesc="The environment plane binaries, library and headers for OpenSAND"
arch=('i686' 'x86_64')
url="http://www.opensand.org"
license=('GPL3')
groups=('opensand')
depends=('glibc')
source=("https://launchpad.net/opensand/0.9.x/0.9.0/+download/opensand-${pkgver}.tar.gz")
md5sums=('16ccb9ce24259f7ca943f05b5b322bc1')

build() {
  cd "$srcdir/opensand-$pkgver"
  tar xf ${pkgname}-${pkgver}.tar.gz
  cd "${pkgname}-${pkgver}"
  # Cf https://bugs.launchpad.net/opensand/+bug/1043991
  aclocal
  libtoolize --force
  autoconf
  autoheader
  automake
  ./configure --sysconfdir=/etc/opensand/env_plane \
              --prefix=/usr \
              --disable-static
  make
}

check() {
  cd "$srcdir/opensand-$pkgver/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/opensand-$pkgver/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
