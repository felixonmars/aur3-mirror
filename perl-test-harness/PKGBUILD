# Maintainer: Abby Pan <abbypan@gmail.com>

pkgname=perl-test-harness
pkgver=3.25
pkgrel=1
pkgdesc="Perl/CPAN Module Test::Harness, run Perl standard test scripts with statistics."
arch=('i686' 'x86_64')
url="https://metacpan.org/module/Test::Harness"
license=('GPL' 'PerlArtistic')
#options=('!emptydirs')
source=(http://cpan.metacpan.org/authors/id/O/OV/OVID/Test-Harness-3.25.tar.gz)
md5sums=('69a8a019eeb952fe97e3ac0767c726da')

build() {
  cd  $startdir/src/Test-Harness-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make || return 1
}

package() {
  cd  $startdir/src/Test-Harness-$pkgver
  make install DESTDIR=$startdir/pkg || return 1
  find $startdir/pkg -name '.packlist' -delete
  find $startdir/pkg -name '*.pod' -delete
}
