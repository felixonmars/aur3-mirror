# Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=perl-audio-beep
_perlmod=Audio-Beep
pkgver=0.11
pkgrel=3
pkgdesc="Perl module to use your computer beeper in fancy ways"
arch=('any')
depends=('perl' 'beep')
url="http://search.cpan.org/~giulienk/Audio-Beep-0.11/Beep.pod"
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/G/GI/GIULIENK/${_perlmod}-${pkgver}.tar.gz)
md5sums=('6956a8749c8dbdcbd44577f7900e85dc')
install=beep.install
build() {
  cd $_perlmod-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor  
  make 
  }
check() {
  cd $_perlmod-$pkgver
  make test
  }
package() {
  cd $_perlmod-$pkgver
  make install DESTDIR="$pkgdir/"
}

