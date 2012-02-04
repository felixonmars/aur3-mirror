# Contributor: Weirch Sodora <sodora@gmail.com>

pkgname=perl-iptables-chainmgr-5.14
pkgver=0.9
pkgrel=1
pkgdesc="IPTables::ChainMgr - Perl extension for manipulating iptables policies"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~mrash/IPTables-ChainMgr/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'iptables' 'perl-net-ipv4addr>=0.10')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/M/MR/MRASH/IPTables-ChainMgr-$pkgver.tar.gz 'ChainMgr.patch')
md5sums=('ce0aea2c3a32671cff5debe16df116fb' '30897436c4d49d96929babb8cdc68c73')

build() {
  cd  $startdir/src/IPTables-ChainMgr-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make || return 1
  make install DESTDIR=$startdir/pkg || return 1
  find $startdir/pkg -name '.packlist' -delete
  find $startdir/pkg -name '*.pod' -delete
  cd $startdir/pkg/usr/share/perl5/vendor_perl/IPTables/ 
  patch -p0 -i $startdir/ChainMgr.patch
}
