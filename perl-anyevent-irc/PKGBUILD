# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-anyevent-irc
pkgver=0.96
pkgrel=1
pkgdesc="An event system independend IRC protocol module"
depends=('perl>=5.10.0' 'glibc' 'perl-anyevent' 'perl-object-event')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/AnyEvent-IRC/"
source=(http://search.cpan.org/CPAN/authors/id/E/EL/ELMEX/AnyEvent-IRC-$pkgver.tar.gz)
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/AnyEvent-IRC-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  
  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}
md5sums=('4f4b042781fd198a53ac7ed03b662fe7')
