# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-tags
pkgver=0.28
pkgrel=2
pkgdesc="Generate (possibly exuberant) Ctags style tags for Perl sourcecode"
depends=('perl>=5.10.0' 'glibc' 'perl-ppi' 'perl-module-locate')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/Perl-Tags/"
source=(http://search.cpan.org/CPAN/authors/id/O/OS/OSFAMERON/Perl-Tags-$pkgver.tar.gz)
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/Perl-Tags-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  
  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}
md5sums=('c7db57564db56d3b77488dc0fc0ce7bd')
