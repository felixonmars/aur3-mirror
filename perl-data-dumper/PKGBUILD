# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=perl-data-dumper
pkgver=2.131
pkgrel=1
pkgdesc="Net::IMAP::Simple - a simple IMAP access library"
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/Data-Dumper/"
depends=('perl')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/Data-Dumper-$pkgver.tar.gz)
md5sums=('653ac6576e6916446419ae4ba786073f')

build() {
  cd $srcdir/Data-Dumper-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor
  make
  make install DESTDIR=$pkgdir
  find $pkgdir -name perllocal.pod -delete
  find $pkgdir -name .packlist -delete
}
