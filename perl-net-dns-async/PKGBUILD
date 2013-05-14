pkgname='perl-net-dns-async'
pkgver='1.07'
pkgrel='1'
pkgdesc='Asynchronous DNS helper for high volume applications'
url='http://search.cpan.org/~shevek/Net-DNS-Async-1.07/'
arch=('i686' 'x86_64')
license=('GPL' 'Artistic')
depends=('perl>=5.8.4')
options=(!emptydirs)
install="${pkgname}.install"
source=("http://search.cpan.org/CPAN/authors/id/S/SH/SHEVEK/Net-DNS-Async-1.07.tar.gz")

build(){
    cd "${srcdir}/Net-DNS-Async-${pkgver}"

    # install module in vendor directories.
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
    make || return 1
    make install DESTDIR=${pkgdir} || return 1

    # remove perllocal.pod and .packlist
    find ${pkgdir} -name perllocal.pod -delete
    find ${pkgdir} -name .packlist -delete
}

md5sums=('72680568d6004f1a3d84820045605abf')
