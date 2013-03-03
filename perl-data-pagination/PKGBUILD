# Created by Yuval Hager <yhager@yhager.com>
pkgname=perl-data-pagination
_pkg=Data-Pagination
_author=ONDR
pkgver=0.44
pkgrel=1
pkgdesc="Paginal navigation on some data"
arch=('any')
url="http://search.cpan.org/dist/${_pkg}/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.12')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/${_author:0:1}/${_author:0:2}/${_author}/${_pkg}-${pkgver}.tar.gz")
md5sums=('cd4d384641a57008e6da66e402a7562b')

build() {
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Makefile.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
    make  || return 1
  else
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Build.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    PERL_MM_USE_DEFAULT=1 perl Build.PL INSTALLDIRS=vendor || return 1
    ./Build  || return 1
  fi fi
}
package() {
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Makefile.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
    make install DESTDIR="${pkgdir}" || return 1

  else
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Build.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    PERL_MM_USE_DEFAULT=1 perl Build.PL INSTALLDIRS=vendor || return 1
    ./Build install destdir=${pkgdir} || return 1
  fi fi
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
# vim:set ts=2 sw=2 et:
