# Maintainer: vae77 <fernandogrd@yahoo.com.br> 

pkgname=grake
pkgver=0.1.0
pkgrel=3
pkgdesc="Command line tool for scanning webpages for Youtube links."
arch=('any')
url="http://code.google.com/p/grake/"
license=('GPL3')
depends=('perl>=5.10.1', 'perl-libwww' 'perl-getopt-argvfile')
optdepends=('perl-umph-prompt: for --interactive')
source=("http://grake.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('be5ce15e342c0628de8cb77728d002f9')

build() {
    cd "$srcdir/${pkgname}-${pkgver}/"
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRDS=vendor
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}/"
    make install DESTDIR="$pkgdir/"

    cd "$pkgdir/"
    ln -sf site_perl/grake usr/bin

    # remove perllocal.pod and .packlist
    find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
