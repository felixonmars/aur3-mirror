# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-io-pipely
pkgver=0.005
pkgrel=1
pkgdesc="Portably create pipe() or pipe-like handles, one way or another."
depends=('perl>=5.10.0')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/~rcaputo/IO-Pipely/"
source=(http://search.cpan.org/CPAN/authors/id/R/RC/RCAPUTO/IO-Pipely-${pkgver}.tar.gz)
options=('!emptydirs')
arch=(i686 x86_64)
md5sums=('86781d3e2afe5f142f67ce1fed3b9ed9')

build()
{
  cd ${srcdir}/IO-Pipely-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
}

package()
{
  cd ${srcdir}/IO-Pipely-$pkgver
  make DESTDIR=${pkgdir} install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete
}
