# Contributor: Tosh <duretsimon73 <at> gmail <dot> com>

pkgname=perl-protoview
pkgver=1.0
pkgrel=1
pkgdesc='Protoview : a tool for having an easly view of protocols which throw your interface'
_dist=protoview
arch=('any')
url="https://github.com/t00sh/protoview"
license=('GPLv3')
depends=(perl perl-net-pcap perl-curses)
options=('!emptydirs' purge)
source=("https://github.com/t00sh/$_dist/archive/$pkgver.tar.gz")
md5sums=('95e51f763b969ef94a854e59b695a392')


build() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
)

check() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
)

package() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)
