# Maintainer: Sebastien Bariteau <numkem@gmail.com>
pkgname=perl-cassandra-simple
pkgver=0.2.1
pkgrel=1
pkgdesc="Cassandra::Simple Perl Module - Easy to use, Perl oriented client interface to Apache Cassandra"
arch=(any)
license=(GPL)
url="https://github.com/fmgoncalves/p5-cassandra-simple"
source="https://github.com/fmgoncalves/p5-cassandra-simple/archive/v${pkgver}.tar.gz"
md5sums=('25f42b73e9ca782c6e9e9dbba7dad8c8')
depends=('perl' 'thrift' 'perl-resourcepool' 'perl-any-moose' 'perl-tie-ixhash' 'perl-bit-vector' 'perl-thrift-xs')
provides=('Cassandra::Simple')

build() {
  cd "$srcdir/p5-cassandra-simple-${pkgver}"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${pkgdir} || return 1

  # remove perllocal.pod and .packlist
  find $pkgdir -name perllocal.pod -delete
  find $pkgdir -name .packlist -delete
}
