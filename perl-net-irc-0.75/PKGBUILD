# Contributor: Henrik Ronellenfitsch <henrik at vs3516.vserver4free.de

pkgname=perl-net-irc
pkgver=0.75
pkgrel=2
pkgdesc="Perl interface to the Internet Relay Chat protocol" 
url="http://search.cpan.org/~jmuhlich/Net-IRC-$pkgver"
source=(http://search.cpan.org/CPAN/authors/id/J/JM/JMUHLICH/Net-IRC-$pkgver.tar.gz)
depends=(perl)
build() {
  cd $startdir/src/Net-IRC-$pkgver
  # Force module installation to "current" perl directories.
  /usr/bin/perl Makefile.PL \
      INSTALLARCHLIB=/usr/lib/perl5/current/${CARCH}-linux-thread-multi \
      INSTALLSITELIB=/usr/lib/perl5/site_perl/current \
      INSTALLSITEARCH=/usr/lib/perl5/site_perl/current/${CARCH}-linux-thread-multi
  /usr/bin/make || return 1
  /usr/bin/make install DESTDIR=$startdir/pkg

  # remove perllocal.pod, .packlist, and empty dirs.
  /bin/rm -rf $startdir/pkg/usr/lib/perl5/current
  /bin/rm -f $startdir/pkg/usr/lib/perl5/site_perl/current/${CARCH}-linux-thread-multi/auto/HTML/Parser/.packlist
}
# vim: ts=2 sw=2 et ft=sh
md5sums=('57587a48ddece7a995c6b138003ee798')
