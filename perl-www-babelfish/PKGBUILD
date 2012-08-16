# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-www-babelfish
pkgver=0.16
pkgrel=1
pkgdesc="Perl extension for translation via Babelfish or Google"
depends=('perl>=5.10.0' 'glibc' 'perl-html-parser' 'perl-io-string' 'perl-libwww')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/WWW-Babelfish"
source=(http://search.cpan.org/CPAN/authors/id/D/DU/DURIST/WWW-Babelfish-$pkgver.tar.gz)
md5sums=('21f881470fd159c6732b4da866648452')
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/WWW-Babelfish-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}

