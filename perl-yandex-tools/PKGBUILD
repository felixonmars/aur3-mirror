pkgname='perl-yandex-tools'
pkgver='0.15'
pkgrel='1'
pkgdesc='useful functions for Yandex daemons and programs.'
url='http://search.cpan.org/dist/Yandex-Tools/'
arch=('i686' 'x86_64')
license=('GPL' 'Artistic')
depends=('perl>=5.8.4')
options=(!emptydirs)
install="${pkgname}.install"
source=("http://search.cpan.org/CPAN/authors/id/K/KO/KOHTS/Yandex-Tools-${pkgver}.tar.gz")

build(){
    cd "${srcdir}/Yandex-Tools-${pkgver}"

    # install module in vendor directories.
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
    make || return 1
    make install DESTDIR=${pkgdir} || return 1

    # remove perllocal.pod and .packlist
    find ${pkgdir} -name perllocal.pod -delete
    find ${pkgdir} -name .packlist -delete
}

md5sums=('ac3e2a39845ad2d9f63676f5ff905659')
