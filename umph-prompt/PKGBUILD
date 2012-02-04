# Maintainer: vae77 <fernandogrd@yahoo.com.br> 

pkgname=umph-prompt
pkgver=0.1.0
pkgrel=1
pkgdesc="Interactive prompt module for umph and similar programs."
arch=('any')
url="http://code.google.com/p/umph/"
license=('GPL3')
depends=('perl>=5.10.1')
source=("http://umph.googlecode.com/files/Umph-Prompt-${pkgver}.tar.gz")
md5sums=('68f339ddf04e79f5ee9aa800a72fe9fe')

build() {
    cd "$srcdir/Umph-Prompt-${pkgver}/"
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRDS=vendor
    make
}

package() {
    cd "$srcdir/Umph-Prompt-${pkgver}/"
    make install DESTDIR="$pkgdir/"

    # remove perllocal.pod and .packlist
    find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
