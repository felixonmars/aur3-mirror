# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-music-tag-mp3
pkgver=0.4101
pkgrel=1
pkgdesc="Plugin module for Music::Tag to get information from id3 tags"
depends=('perl>=5.10.0' 'glibc' 'perl-music-tag' 'perl-mp3-tag' 'perl-mp3-info')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/Music-Tag-MP3"
source=(http://search.cpan.org/CPAN/authors/id/E/EA/EALLENIII/Music-Tag-MP3-$pkgver.tar.gz)
md5sums=('40e8af5b326017b823e4e8f93b594fa2')
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/Music-Tag-MP3-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}

