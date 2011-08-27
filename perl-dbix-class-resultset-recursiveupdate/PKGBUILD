# CPAN Name  : DBIx-Class-ResultSet-RecursiveUpdate
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.19
pkgname='perl-dbix-class-resultset-recursiveupdate'
pkgver='0.013'
pkgrel='1'
pkgdesc="like update_or_create - but recursive"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-datetime' 'perl-dbd-sqlite>=1.21' 'perl-dbix-class>=0.08100' 'perl-dbix-class-introspectablem2m' 'perl-readonly>=1.03' 'perl-sql-translator>=0.09004')
url='http://search.cpan.org/dist/DBIx-Class-ResultSet-RecursiveUpdate'
source=('http://search.cpan.org/CPAN/authors/id/J/JJ/JJNAPIORK/DBIx-Class-ResultSet-RecursiveUpdate-0.013.tar.gz')
md5sums=('1951818d50857854f9cdf6669b9730ef')

build() {
  DIST_DIR="${srcdir}/DBIx-Class-ResultSet-RecursiveUpdate-0.013"
  export PERL_MM_USE_DEFAULT=1
  { cd "$DIST_DIR" &&    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&make test &&
    make DESTDIR="$pkgdir" install;  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

