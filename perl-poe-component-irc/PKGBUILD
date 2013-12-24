# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-poe-component-irc
pkgver=6.83
pkgrel=2
pkgdesc="A fully event-driven IRC client module"
depends=('perl>=5.10.0' 'glibc' 'perl-poe' 'perl-poe-filter-ircd' 'perl-poe-component-pluggable' 'perl-poe-component-client-dns' 'perl-irc-utils')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/POE-Component-IRC"
source=(http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/POE-Component-IRC-${pkgver}.tar.gz)
md5sums=('e5ecb8808f1c4543ca0be0f2a1099e1f')
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/POE-Component-IRC-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1

}

package()
{
  cd ${srcdir}/POE-Component-IRC-$pkgver
  make DESTDIR=${pkgdir} install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete
}
