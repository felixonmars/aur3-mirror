# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-latex-driver
pkgver=0.12
pkgrel=1
pkgdesc="Latex driver"
depends=('perl>=5.10.0' 'glibc' 'perl-exception-class' 'perl-class-accessor' 'perl-file-slurp' 'texlive-bin' 'ghostscript')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/LaTeX-Driver/"
source=(http://search.cpan.org/CPAN/authors/id/A/AN/ANDREWF/LaTeX-Driver-${pkgver}.tar.gz)
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/LaTeX-Driver-${pkgver}

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
}

package()
{
  cd ${srcdir}/LaTeX-Driver-${pkgver}

  make DESTDIR=${pkgdir} install || return 1
  
  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete
}

md5sums=('9f273f56f4bb0ed0e0fb3fccaf7a8a18')
