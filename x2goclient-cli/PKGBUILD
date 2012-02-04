# Contributor: Richard Murri <admin@richardmurri.com>
pkgname=x2goclient-cli
pkgver=3.0.1_1.2
pkgrel=1
pkgdesc="x2go command line client"
arch=(i686 x86_64)
url="http://www.x2go.org"
license=('GPL')
groups=('x2go')
depends=(nxcomp nxproxy perl-term-read-password perl-proc-simple)
source=(http://x2go.obviously-nice.de/deb/pool-lenny/x2goclient-cli/${pkgname}_${pkgver//_/-}.tar.gz)


build() {
  cd "$srcdir/$pkgname-${pkgver%_*}"

  install -Dm755 x2goclient-cli ${pkgdir}/usr/sbin/x2goclient-cli
}

# vim:set ts=2 sw=2 et:

md5sums=('bbe5c4e31cbfac26a3179d8479c3eca4')
