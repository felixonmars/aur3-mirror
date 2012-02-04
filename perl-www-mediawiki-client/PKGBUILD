# $Id$
# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>

pkgname=perl-www-mediawiki-client
pkgver=0.31
pkgrel=3
pkgdesc="provides a very simple cvs-like interface for Mediawiki driven WikiWiki websites"
arch=("i686" "x86_64")
url="http://search.cpan.org/~markj/WWW-Mediawiki-Client/"
license=()
makedepends=("perl")
depends=("perl" "perl-libwww" "perl-xml-libxml" "perl-test-differences"
"perl-exception-class" "perl-test-differences" "perl-vcs-lite")
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MARKJ/WWW-Mediawiki-Client-$pkgver.tar.gz"
)
md5sums=('597786dfa9b958c9a3a57bf4e233c95e')


build() {
  cd $startdir/src/WWW-Mediawiki-Client-$pkgver

  eval `perl -V:archname`
  /usr/bin/perl Makefile.PL \
  INSTALLARCHLIB=/usr/lib/perl5/current/${archname} \
  INSTALLSITELIB=/usr/lib/perl5/site_perl/current \
  INSTALLSITESCRIPT=/usr/bin \
  INSTALLSITEARCH=/usr/lib/perl5/site_perl/current/${archname} || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  /usr/bin/find $startdir/pkg -name '.packlist' -exec rm  '{}' \; && \
  /usr/bin/find $startdir/pkg -name 'perllocal.pod' -exec rm  '{}' \; && \
  /usr/bin/find $startdir/pkg -depth -type d -empty -exec rmdir '{}' \;

}
