pkgname='perl-convert-uu'
pkgver='0.5201'
pkgrel='1'
pkgdesc='Convert::UU, uuencode, uudecode - Perl module for uuencode and uudecode'
url='http://search.cpan.org/~andk/Convert-UU-0.5201/'
arch=('i686' 'x86_64')
license=('GPL' 'Artistic')
depends=('perl>=5.8.4')
options=(!emptydirs)
install="${pkgname}.install"
source=("http://search.cpan.org/CPAN/authors/id/A/AN/ANDK/Convert-UU-${pkgver}.tar.gz")

build(){
    cd "${srcdir}/Convert-UU-${pkgver}"

    # install module in vendor directories.
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
    make || return 1
    make install DESTDIR=${pkgdir} || return 1

    # remove perllocal.pod and .packlist
    find ${pkgdir} -name perllocal.pod -delete
    find ${pkgdir} -name .packlist -delete
}

md5sums=('f60f49d15770503efa5ed0c81296ef2f')
