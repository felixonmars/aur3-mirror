# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-audio-m4p
pkgver=0.55
pkgrel=1
pkgdesc="Perl QuickTime / MP4 / iTunes Music Store audio / video file tools"
depends=('perl>=5.10.0' 'glibc' 'perl-tree-simple-view' 'perl-crypt-rijndael')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/Audio-M4P"
source=(http://search.cpan.org/CPAN/authors/id/B/BI/BILLH/Audio-M4P-$pkgver.tar.gz)
md5sums=('98efc58535fe318200acbc2a824e8399')
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/Audio-M4P-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}

