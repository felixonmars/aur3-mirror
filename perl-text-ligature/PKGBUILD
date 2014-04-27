# Maintainer: Filip Gralinski <filip@amu.edu.pl>
pkgname=perl-text-ligature
_realname=Text-Ligature
pkgver=0.02
pkgrel=1
pkgdesc="Perl/CPAN Module Text::Ligature : Replace sequences of characters with typographic ligatures"
arch=('any')
url="http://search.cpan.org/dist/${_realname}/"
license=('GPL' 'Artistic')
depends=('perl>=5.10.0')
source=("http://www.cpan.org/authors/id/P/PA/PATCH/${_realname}-${pkgver}.tar.gz")
md5sums=('da384b01fa9b976e8bbcb67d0a9dc846')
options=('!emptydirs')

build() {
  cd "${_realname}-${pkgver}"

 # Setting these env variables overwrites any command-line options we don't want...
 export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
   PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
   PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
   PERL5LIB="" PERL_LOCAL_LIB_ROOT="" \
   MODULEBUILDRC=/dev/null

 # If using Build.PL
 { /usr/bin/perl Build.PL &&
   ./Build &&
   ./Build test &&
   ./Build install; } || return 1

 # remove perllocal.pod and .packlist
 find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
