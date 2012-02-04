# Maintainer: Simon Perry <pezz [at] sanxion [dot] net>

pkgname=perl-icontrol
pkgver=0.03
pkgrel=1
pkgdesc="A Perl interface to the F5 iControl API"
depends=('glibc' 'perl>=5.10.0' 'perl-soap-lite')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/iControl/"
source=(http://search.cpan.org/CPAN/authors/id/L/LT/LTP/iControl-$pkgver.tar.gz)
options=('!emptydirs')
arch=(any)

build()
{
    cd ${srcdir}/iControl-$pkgver

    perl Makefile.PL INSTALLDIRS=vendor || return 1
    make || return 1
    make DESTDIR=${pkgdir} install || return 1
  
    # Remove .packlist and perllocal.pod files.
    find ${pkgdir} -name '.packlist' -delete
    find ${pkgdir} -name 'perllocal.pod' -delete
}

md5sums=('afe1dab870b2704394d9a7946648b382')
