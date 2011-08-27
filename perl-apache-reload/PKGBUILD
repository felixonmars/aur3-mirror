# Maintainer: Liu DongMiao <liudongmiao@gmail.com>

pkgname=perl-apache-reload
pkgver=0.10
pkgrel=1
pkgdesc="Reload Perl Modules when Changed on Disk"
arch=(i686 x86_64)
url="http://search.cpan.org/~phred/Apache-Reload/"
license=('APACHE')
depends=('perl>=5.10.0')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/P/PH/PHRED/Apache-Reload-$pkgver.tar.gz) 
md5sums=('1d89841153b76b384e08479e3e26082a')

build() {
  cd  $startdir/src/Apache-Reload-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make || return 1
  make install DESTDIR=$startdir/pkg || return 1
  find $startdir/pkg -name '.packlist' -delete
  find $startdir/pkg -name '*.pod' -delete
}
# vim: ft=sh ts=2 sw=2 et:
