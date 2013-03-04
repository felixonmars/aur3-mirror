pkgname=perl-algorithm-checkdigits
pkgver=1.2.1
pkgrel=1
pkgdesc="Perl extension to generate and test check digits"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Algorithm-CheckDigits/"
license=('perl')
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MAMAWE/Algorithm-CheckDigits-v1.2.1.tar.gz')
md5sums=('21e16cca154f17d3adea72573652a262')
depends=('perl-version')
makedepends=('perl-module-build>=0.360.0' 'perl-probe-perl')
provides=('perl-algorithm-checkdigits-m07_001=0.530.0' 'perl-algorithm-checkdigits-m09_001=0.530.0' 'perl-algorithm-checkdigits-m10_001=v1.1.0' 'perl-algorithm-checkdigits-m10_002=0.530.0' 'perl-algorithm-checkdigits-m10_003=0.530.0' 'perl-algorithm-checkdigits-m10_004=0.530.0' 'perl-algorithm-checkdigits-m10_005=0.530.0' 'perl-algorithm-checkdigits-m10_006=0.530.0' 'perl-algorithm-checkdigits-m10_008=1.2.1' 'perl-algorithm-checkdigits-m10_009=0.530.0' 'perl-algorithm-checkdigits-m10_010=0.530.0' 'perl-algorithm-checkdigits-m10_011=1.1.2' 'perl-algorithm-checkdigits-m11_001=0.530.0' 'perl-algorithm-checkdigits-m11_002=0.530.0' 'perl-algorithm-checkdigits-m11_003=0.530.0' 'perl-algorithm-checkdigits-m11_004=1.1.2' 'perl-algorithm-checkdigits-m11_006=1.1.2' 'perl-algorithm-checkdigits-m11_007=0.530.0' 'perl-algorithm-checkdigits-m11_008=0.530.0' 'perl-algorithm-checkdigits-m11_009=0.530.0' 'perl-algorithm-checkdigits-m11_010=0.530.0' 'perl-algorithm-checkdigits-m11_011=0.530.0' 'perl-algorithm-checkdigits-m11_012=0.530.0' 'perl-algorithm-checkdigits-m11_013=0.530.0' 'perl-algorithm-checkdigits-m11_015=0.530.0' 'perl-algorithm-checkdigits-m11_016=0.530.0' 'perl-algorithm-checkdigits-m11_017=0.530.0' 'perl-algorithm-checkdigits-m16_001=0.530.0' 'perl-algorithm-checkdigits-m23_001=0.530.0' 'perl-algorithm-checkdigits-m23_002=0.530.0' 'perl-algorithm-checkdigits-m43_001=0.530.0' 'perl-algorithm-checkdigits-m89_001=0.530.0' 'perl-algorithm-checkdigits-m97_001=0.530.0' 'perl-algorithm-checkdigits-m97_002=1.2.1' 'perl-algorithm-checkdigits-mbase_001=0.530.0' 'perl-algorithm-checkdigits-mbase_002=1.1.2' 'perl-algorithm-checkdigits-mbase_003=1.2.1' 'perl-algorithm-checkdigits-mxx_001=1.2.0' 'perl-algorithm-checkdigits-mxx_002=0.530.0' 'perl-algorithm-checkdigits-mxx_003=1.2.1' 'perl-algorithm-checkdigits-mxx_004=0.530.0' 'perl-algorithm-checkdigits-mxx_005=0.530.0' 'perl-algorithm-checkdigits-mxx_006=1.1.2')
options=(!emptydirs)

build() {
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Makefile.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
    make  || return 1
    make install DESTDIR="${pkgdir}" || return 1

  else
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Build.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    PERL_MM_USE_DEFAULT=1 perl Build.PL INSTALLDIRS=vendor || return 1
    ./Build  || return 1
    ./Build install destdir=${pkgdir} || return 1

  else
    echo "error: failed to detect build method for $pkgname"
    echo "you may be able to fix this by editing the PKGBUILD"
    return 1
  fi fi

  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}

# vim:set ts=2 sw=2 et:


