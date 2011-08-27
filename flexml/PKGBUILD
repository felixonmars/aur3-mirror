# Contributor: Robson Peixoto <robsonpeixoto@gmail.com>
pkgname=flexml
pkgver=1.8
pkgrel=1
pkgdesc="Generate fast validating XML processors and applications"
arch=('i686' 'x86_64')
url="http://packages.debian.org/source/sid/flexml"
license=('GPL')
depends=('perl>=5.10.0' 'perl-libwww' 'perl-date-calc')
source=(http://ftp.de.debian.org/debian/pool/main/f/flexml/flexml_${pkgver}.orig.tar.gz)
md5sums=('51a46eabad6a2ba3d74228545603b8a5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make POD2MAN="/usr/bin/perlbin/core/pod2man" || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
