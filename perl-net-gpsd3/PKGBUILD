
# Contributor: Troy Will <troydwill@gmail.com>
pkgname=perl-net-gpsd3
pkgver=0.19
pkgrel=1
pkgdesc='This packages the Net::GPSD3 module'
_dist=Net-GPSD3
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-json-xs perl-io-socket-inet6 perl-datetime perl-datetime-format-w3cdtf perl-gps-point)

options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/M/MR/MRDVT/$_dist-$pkgver.tar.gz")
md5sums=('c447b8bd633aa7408a181a391ccfb183')

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
