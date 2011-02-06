# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-www-search
pkgver=2.508
pkgrel=1
pkgdesc="Virtual base class for WWW searches"
depends=('perl>=5.10.0' 'glibc' 'perl-user' 'perl-html-tree' 'perl-test-pod' 'perl-bit-vector' 'perl-file-slurp' 'perl-test-pod-coverage' 'perl-test-file' 'perl-date-manip')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/WWW-Search"
source=(http://search.cpan.org/CPAN/authors/id/M/MT/MTHURN/WWW-Search-$pkgver.tar.gz)
md5sums=('287e248762977efb81f495588c51003b')
options=('force' '!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/WWW-Search-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}

