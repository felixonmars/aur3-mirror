# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-www-search-search
pkgver=1.015
pkgrel=1
pkgdesc="class for searching www.search.com"
depends=('perl>=5.10.0' 'glibc' 'perl-www-search')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/WWW-Search-Search"
source=(http://search.cpan.org/CPAN/authors/id/M/MT/MTHURN/WWW-Search-Search-$pkgver.tar.gz)
md5sums=('6d5cab65d039406a74de16908ceb327f')
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/WWW-Search-Search-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}

