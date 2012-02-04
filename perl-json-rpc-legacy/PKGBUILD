#http://search.cpan.org/CPAN/authors/id/D/DM/DMAKI/JSON-RPC-1.01.tar.gz
pkgname=perl-json-rpc-legacy
pkgver=0.96
pkgrel=1
pkgdesc="Perl implementation of JSON-RPC 1.1 protocol"
arch=('i686' 'x86_64')
provides=('perl-json-rpc=0.96')
url="http://search.cpan.org/~makamaka/JSON-RPC-0.96/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
#source=(http://search.cpan.org/CPAN/authors/id/D/DM/DMAKI/JSON-RPC-$pkgver.tar.gz) 
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MAKAMAKA/JSON-RPC-$pkgver.tar.gz)

build() {
  cd  $startdir/src/JSON-RPC-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make || return 1
  make install DESTDIR=$startdir/pkg || return 1
  find $startdir/pkg -name '.packlist' -delete
  find $startdir/pkg -name '*.pod' -delete
  ln -s $startdir/pkg/usr/share/
}
md5sums=('3912464c3cf59b60131fd2b15400192a')
