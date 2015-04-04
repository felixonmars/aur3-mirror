
# Contributor: Troy Will <troydwill@gmail.com>
pkgname=perl-gps-point
pkgver=0.20
pkgrel=1
pkgdesc='This packages the GPS::Point module'
_dist=GPS-Point
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-test-number-delta)

options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/M/MR/MRDVT/$_dist-$pkgver.tar.gz")
md5sums=('9f486722d6bfa17cc2144a3c3c4a9b9f')

build() (
    cd "$srcdir/$_dist-$pkgver"
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
    /usr/bin/perl Makefile.PL
    make
)

check() (
    cd "$srcdir/$_dist-$pkgver"
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1
    make test
)

package() (
    cd "$srcdir/$_dist-$pkgver"
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)
