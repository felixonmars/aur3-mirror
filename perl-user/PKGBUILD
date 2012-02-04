# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-user
pkgver=1.9
pkgrel=1
pkgdesc="API for locating user information regardless of OS"
depends=('perl>=5.10.0' 'glibc')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/User"
source=(http://search.cpan.org/CPAN/authors/id/T/TB/TBONE/User-$pkgver.tar.gz)
md5sums=('53193e6c37b6d9efb726caf59a8aead7')
options=('force' '!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/User-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}

