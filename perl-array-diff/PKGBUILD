# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-array-diff
pkgver=0.07
pkgrel=1
pkgdesc="Diff two arrays"
depends=('perl>=5.10.0' 'glibc' 'perl-class-accessor' 'perl-algorithm-diff')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/Array-Diff"
source=(http://search.cpan.org/CPAN/authors/id/T/TY/TYPESTER/Array-Diff-$pkgver.tar.gz)
md5sums=('031adfbe03c18fb04dcf6f071471dbc5')
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/Array-Diff-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
 
  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}

