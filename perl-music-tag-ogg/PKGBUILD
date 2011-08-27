# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-music-tag-ogg
pkgver=0.4101
pkgrel=1
pkgdesc="Plugin module for Music::Tag to get information from ogg-vorbis headers"
depends=('perl>=5.10.0' 'glibc' 'perl-music-tag' 'perl-ogg-vorbis-header-pureperl')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/Music-Tag-OGG"
source=(http://search.cpan.org/CPAN/authors/id/E/EA/EALLENIII/Music-Tag-OGG-$pkgver.tar.gz)
md5sums=('6db15f3c23145776f354d5d223c97e5b')
options=('force' '!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/Music-Tag-OGG-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}

