# Contributor: Alessandro Sagratini <ale_sagra at hotmail dot com>
pkgname=perl-net-amazon-ec2
pkgver=0.24
pkgrel=1
pkgdesc="Perl interface to the Amazon Elastic Compute Cloud (EC2) environment."
url='http://search.cpan.org/dist/Net-Amazon-EC2'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-moose' 'perl-params-validate' 'perl-uri' 'perl-xml-simple' 'perl-lwp-protocol-https' 'perl-test-exception')
changelog=Changes
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MALLEN/Net-Amazon-EC2-${pkgver}.tar.gz)
md5sums=('558c1ae48e2c82dd49a8607cbc811a7e')
sha512sums=('8e2528c0d792dfa41669ab6ef50c524400abe13a82d39863e4035bd82fc4d77365304db68a78389585b9ec8ea6619e03b52e51cdf1b7d622ace66b9a92d0c556')

build() {
    cd "$srcdir/Net-Amazon-EC2-$pkgver"

    # install module in vendor directories.
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
    make || return 1
}

package() {
    cd "$srcdir/Net-Amazon-EC2-$pkgver"
    make install DESTDIR=${pkgdir} || return 1
    # remove perllocal.pod and .packlist
    find "$pkgdir" -name perllocal.pod -delete
    find "$pkgdir" -name .packlist -delete
}

