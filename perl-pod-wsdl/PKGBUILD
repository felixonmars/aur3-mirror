# Maintainer: Kasper Laudrup <laudrup@stacktrace.dk>
_perlmod=Pod-WSDL
pkgname=perl-pod-wsdl
pkgver=0.061
pkgrel=1
pkgdesc='Pod::WSDL - Creates WSDL documents from (extended) pod'
arch=('any')
url='http://search.cpan.org/~jcop/Pod-WSDL-0.061/'
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl>=5.10.0' 'perl-xml-writer' 'perl-io-stringy' 'perl-xml-xpath')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/J/JC/JCOP/$_perlmod-$pkgver.tar.gz")
md5sums=('605db468a0c594f23c5f2dee6dcc9e5a')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  { /usr/bin/perl Makefile.PL &&
    make &&
    make test; } || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}
