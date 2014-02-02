# Maintainer: Oliver Gasser <oliver.gasser@gmail.com>

_author=B/BR/BRONDSEM
_perlmod=Mail-SpamAssassin-Plugin-OpenPGP
pkgname=perl-mail-spamassassin-plugin-openpgp
pkgver=1.0.4
pkgrel=1
pkgdesc="A SpamAssassin plugin that validates OpenPGP signed email."
arch=('any')
url="http://search.cpan.org/~brondsem/$_perlmod-$pkgver/"
license=('Apache License, Version 2.0')
depends=('perl>=5.10.0' 'spamassassin' 'perl-mail-gpg')
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=("8f3f976d217a20caff45ca9dfef6f72b")

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"

  perl Build install
}

# vim:set ts=2 sw=2 et:
