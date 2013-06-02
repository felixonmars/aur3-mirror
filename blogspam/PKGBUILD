# Contributor: Changaco <changaco ατ changaco δοτ net>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='blogspam'
pkgver='1.0.2'
pkgrel='2'
pkgdesc="Test blog comments for SPAM, in real-time"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-libwww' 'perl-net-cidr-lite' 'perl-net-dns' 'perl-rpc-xml' 'perl-uri-find')
url='http://blogspam.net/'
source=('http://search.cpan.org/CPAN/authors/id/S/SK/SKX/Blog-Spam-1.0.2.tar.gz'
        blogspam.service)
install=$pkgname.install
_distdir="Blog-Spam-1.0.2"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
  install -D "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  for a in hourly daily weekly; do
    install -d "$pkgdir/etc/cron.$a"
    echo -e "#!/bin/sh\n/usr/bin/vendor_perl/blogspam --$a" >"$pkgdir/etc/cron.$a/$pkgname"
    chmod +x "$pkgdir/etc/cron.$a/$pkgname"
  done
}

md5sums=('d67648699175351c8e479e856623affb'
         '268e1be8216f7379d0ce081a880122f6')
