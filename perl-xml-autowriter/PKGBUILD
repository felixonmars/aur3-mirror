#
# Contributor: Georg Grabler (STiAT) <ggrabler@gmail.com>
#
pkgname=perl-xml-autowriter
pkgver=0.39
pkgrel=2
pkgdesc="XML::Doctype - A DTD object class"
url="http://search.cpan.org/~rbs/XML-AutoWriter-0.39/lib/XML/Doctype.pm"
license="GPL"
depends=('perl')
arch=('i686' 'x86_64')
options=('noemptydirs')

source=(http://search.cpan.org/CPAN/authors/id/R/RB/RBS/XML-AutoWriter-$pkgver.tar.gz)
md5sums=('6f202ab799f398ee7d6f4efea39aa514')

build() {
  cd $startdir/src/XML-AutoWriter-$pkgver
  /usr/bin/perl Makefile.PL
  make
  make DESTDIR=$startdir/pkg install

  /usr/bin/find $startdir/pkg -name '.packlist' -exec rm '{}' \;
  /usr/bin/find $startdir/pkg -name 'perllocal.pod' -exec rm '{}' \;
}
