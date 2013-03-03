# Created by Yuval Hager <yhager@yhager.com>
_cpan_pkg=Template-Plugin-HtmlToText
_cpan_author=FAYLAND
pkgname=perl-template-plugin-htmltotext #${_cpan_pkg,,}
pkgver=0.03
pkgrel=1
pkgdesc="Plugin interface to HTML::FormatText"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/${_cpan_pkg}/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.12')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/${_cpan_author:0:1}/${_cpan_author:0:2}/${_cpan_author}/${_cpan_pkg}-${pkgver}.tar.gz")
md5sums=('d5400a942b2b5be3d8c5d003782430db')


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
