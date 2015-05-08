# Maintainer: Christian Sturm <reezer@reezer.org>
# Contributor: Justin Davis <jrcd83@gmail.com>
pkgname=perl-tokyocabinet
_distname=tokyocabinet-perl
pkgver=1.34
_distfile="${_distname}-${pkgver}.tar.gz"
pkgrel=2
pkgdesc="Perl binding for TokyoCabinet DBM"
arch=('i686' 'x86_64')
license=('LGPL2.1')
options=('!emptydirs')
depends=('perl>=5.10' 'tokyocabinet')
url='http://fallabs.com/tokyocabinet'
source=("http://fallabs.com/tokyocabinet/perlpkg/${_distfile}")
md5sums=('e83e45e6a209dd81530b57d9414fd6ab')

build() {
  cd "$srcdir/${_distname}-${pkgver}"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

    perl Makefile.PL INSTALLDIRS=vendor
    make
}

check() {
  cd "$srcdir/${_distname}-${pkgver}"
  make test
}

package() {
  cd "$srcdir/${_distname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}

# Local variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
