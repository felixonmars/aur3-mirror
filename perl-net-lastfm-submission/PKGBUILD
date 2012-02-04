# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-net-lastfm-submission
pkgver=0.64
pkgrel=1
pkgdesc="Perl interface to the Last.fm Submissions Protocol"
depends=('perl>=5.10.0' 'glibc' 'perl-test-exception' 'perl-libwww' 'perl-poe-component-client-http')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/Net-LastFM-Submission"
source=(http://search.cpan.org/CPAN/authors/id/S/SH/SHARIFULN/Net-LastFM-Submission-$pkgver.tar.gz)
md5sums=('0d39fded5d75ac2866ff0a14957683bb')
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/Net-LastFM-Submission-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  
  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}

