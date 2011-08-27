# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-music-tag-m4a
pkgver=0.4101
pkgrel=1
pkgdesc="Plugin module for Music::Tag to get information from Apple QuickTime headers"
depends=('perl>=5.10.0' 'glibc' 'perl-music-tag' 'perl-mp4-info' 'perl-audio-m4p')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/Music-Tag-M4A"
source=(http://search.cpan.org/CPAN/authors/id/E/EA/EALLENIII/Music-Tag-M4A-$pkgver.tar.gz)
md5sums=('d873024b7275846b69dcc8cf4ce27444')
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/Music-Tag-M4A-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}

