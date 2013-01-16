# Contributor: Lukas Sabota <LTSsmooth42@gmail.com>
# Maintainer: Lukas Sabota <LTSsmooth42@gmail.com>
_perlmod=sieve-connect
pkgname=perl-$_perlmod
pkgver=0.84
pkgrel=1
pkgdesc="Command line client for the MANAGESIEVE protocol."
arch=(any)
url="http://people.spodhuis.org/phil.pennock/software/"
license=('custom-free')
depends=('perl>=5.10.0' 'perl-authen-sasl' 'perl-io-socket-ssl' 'perl-io-socket-inet6' 'perl-net-dns' 'perl-term-readkey')
options=(!emptydirs)
install=
source=("http://people.spodhuis.org/phil.pennock/software/$_perlmod-$pkgver.tar.bz2")
md5sums=('17ec57ddcab5b22c09f6983ccbe37c64')

build() {
  cd "$srcdir/$_perlmod-$pkgver"
  make
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  install -D -m 755 sieve-connect $pkgdir/usr/bin/sieve-connect
}

# vim:set ts=2 sw=2 et:
