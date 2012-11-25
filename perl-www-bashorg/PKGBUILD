# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-www-bashorg
pkgver=0.0103
pkgrel=1
pkgdesc="simple module to obtain quotes from http://bash.org"
depends=('perl>=5.10.0' 'glibc' 'perl-libwww' 'perl-html-tokeparser-simple')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/WWW-BashOrg"
source=(http://search.cpan.org/CPAN/authors/id/Z/ZO/ZOFFIX/WWW-BashOrg-${pkgver}.tar.gz)
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/WWW-BashOrg-${pkgver}

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}
md5sums=('0cedf661c9c5705474e9aa76cec4c422')
