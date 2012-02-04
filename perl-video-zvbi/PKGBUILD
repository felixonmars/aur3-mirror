# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=perl-video-zvbi
_realname=Video-ZVBI
pkgver=0.2.5
pkgrel=1
pkgdesc="Perl/CPAN Module Video::ZVBI : VBI decoding (teletext, closed caption)"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Video-ZVBI"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'zvbi')
makedepends=('gcc')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/T/TO/TOMZO/${_realname}-${pkgver}.tar.gz)
md5sums=('1c714b6eeaaa6ce97b723fd9fb1786fd')
sha256sums=('501202bf220601217a4317045a88034ca7d3361133d1a790d3e6e67ad7d9508a')

build() {
  cd "$srcdir/${_realname}-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR="$pkgdir" || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

# vim:set ts=2 sw=2 et:
