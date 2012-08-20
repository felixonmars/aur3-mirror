# Maintainer: Alexander Duscheleit <jinks@archlinux.us>
pkgname=kyotocabinet-perl
pkgver=1.20
pkgrel=1
pkgdesc="Perl bindings for Kyoto Cabinet."
arch=('i686' 'x86_64')
url="http://fallabs.com/kyotocabinet/"
license=('GPL3')
depends=('kyotocabinet>=1.2.34' 'perl')
source=(http://fallabs.com/kyotocabinet/perlpkg/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
sha512sums=('a529d47426ec8403fadf4bcc77a3a2a2c8cf72bfe3a23db54f2445ce88f23f07ca7e879bc21d9c6d7a2d7a2f7ab23bfe0f24bc7d083570c0048cb59bf975fb0c')
