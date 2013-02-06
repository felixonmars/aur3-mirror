# Contributor: Konrad Borowski <glitchmr@myopera.com>
pkgname=mowyw
pkgver=0.7.1
pkgrel=1
pkgdesc='Macro processor and Offline Content Management System'
arch=('any')
url='https://metacpan.org/module/mowyw'
license=('Artistic2.0')
depends=('perl>=5.8.1'
'perl-config-file'
'perl-file-temp')
makedepends=()
optdepends=('perl-dbi: SQL data source'
'perl-text-vimcolor: Syntax highlighting'
'perl-xml-simple: XML data source')
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs')
install=
source=("http://search.cpan.org/CPAN/authors/id/M/MO/MORITZ/App-Mowyw-v$pkgver.tar.gz")
md5sums=('803706cb7d353301a99774aac20c494c')

build() {
  cd "$srcdir/App-Mowyw-v$pkgver"
  
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  # If using Build.PL
  { /usr/bin/perl Build.PL &&
    ./Build &&
    ./Build test &&
    ./Build install; } || return 1
}
