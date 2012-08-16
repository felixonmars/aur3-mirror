# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-math-expression-evaluator
pkgver=0.3.0
pkgrel=1
pkgdesc="parses, compiles and evaluates mathematic expressions"
depends=('perl>=5.10.0' 'glibc')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/Math-Expression-Evaluator"
source=(http://search.cpan.org/CPAN/authors/id/M/MO/MORITZ/Math-Expression-Evaluator-$pkgver.tar.gz)
md5sums=('0f0a36381074b176ccd08d489d027a7f')
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/Math-Expression-Evaluator-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}

