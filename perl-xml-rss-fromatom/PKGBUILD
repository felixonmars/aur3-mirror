# $Id: PKGBUILD 23926 2010-08-18 10:23:59Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Francois Charette <firmicus@gmx.net>

pkgname=perl-xml-rss-fromatom
pkgver=0.02
pkgrel=1
pkgdesc="Create a XML::RSS object out of an Atom feed."
arch=('any')
url="http://search.cpan.org/dist/XML-RSS-FromAtom/"
license=('GPL' 'PerlArtistic')
depends=('perl-datetime' 'perl-datetime-format-mail' 'perl-datetime-format-iso8601' 'perl-class-accessor')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARCUS/XML-RSS-FromAtom-$pkgver.tar.gz)
md5sums=('a1a0806866f1670e57236dacb5e1abb7')

build() {
  cd  $srcdir/XML-RSS-FromAtom-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR=$pkgdir || return 1
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
