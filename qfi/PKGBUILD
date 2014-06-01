# Maintainer: Wesley Merkel <ooesili@gmail.com>
pkgname=qfi
pkgver=0.4.1
pkgrel=1
pkgdesc='Quickly edit commonly used files'
arch=('any')
url="https://github.com/ooesili/$pkgname"
license=('GPL')
depends=('perl' 'sudo')
optdepends=('bash-completion: autocomplete targets and options')
options=('!emptydirs' 'purge' '!strip')
install=${pkgname}.install
source=("https://github.com/ooesili/qfi/archive/v${pkgver}.tar.gz"
        'qfi.install')
sha512sums=('cbe0d48575804f8e41e0c5007ed4f6f3f8b2d356b34b6194f857788023f85a4c0e2f8bf2006f5e9cc0d96f9845c2af672c763d94336ada686012a564cc7ee938'
            '6e082e15d738f98eef589eee5b4707408fe394af7e0626e442dfc0b6aa1097ef216252c446c5a54d26d3376f9d49c618df4ca13dc4df3edbf1175260395442bd')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # change environment variables that may cause unpredicatable behavior
    unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null

    # create and build script and build
    /usr/bin/perl Build.PL
    ./Build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # change environment variables that may cause unpredicatable behavior
    unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT

    # install
    ./Build install --installdirs=vendor --destdir="$pkgdir"
}
