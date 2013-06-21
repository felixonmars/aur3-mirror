# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=perl-audio-cd
pkgver=0.05
pkgrel=3
pkgdesc="Perl interface for libcdaudio (cd + cddb)"
arch=('i686' 'x86_64')
url="http://www.vanhemert.co.uk/disc-cover.html"
license=('PerlArtistic')
depends=('perl' 'libcdaudio')
conflicts=('perl-audio-cd-deb')
options=(!emptydirs !zipman)
source=(http://www.vanhemert.co.uk/files/Audio-CD-0.05.tar.gz)

build() {
  cd "$srcdir/Audio-CD-0.05"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
#  perl Makefile.PL
  make
}

package() {
  cd "$srcdir/Audio-CD-0.05"
  make install DESTDIR=$pkgdir
  find $pkgdir -name '.packlist' -delete
  find $okgdir -name '*.pod' -delete
}

md5sums=('038d1f4cc58c8e4e025a53346f301582')
