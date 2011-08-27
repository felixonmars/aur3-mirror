# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-music-tag-flac
pkgver=0.4101
pkgrel=1
pkgdesc="Plugin module for Music::Tag to get information from flac headers"
depends=('perl>=5.10.0' 'glibc' 'perl-music-tag' 'perl-audio-flac-header')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/Music-Tag-FLAC"
source=(http://search.cpan.org/CPAN/authors/id/E/EA/EALLENIII/Music-Tag-FLAC-$pkgver.tar.gz)
md5sums=('eca4c98244f2553c5515b3f72ae8975f')
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/Music-Tag-FLAC-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}

