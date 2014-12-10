# Maintainer : Nigel Gourlay <ngourlay@gmail.com>

pkgname=perl-test-dbix-class
_cpanname=Test-DBIx-Class
pkgver=0.43
pkgrel=1
pkgdesc="Test-DBIx-Class"
arch=('any')
url="http://search.cpan.org/~JJNAPIORK/${_cpanname}"
license=('GPL' 'PerlArtistic')
depends=('perl-config-any>=0.19' 'perl-dbix-class>=0.08123' 'perl-dbix-class-schema-populatemore>=0.16' 'perl-dbix-class-timestamp>=0.13' 'perl-dbix-class-uuidcolumns>=0.02005' 'perl-data-uuid>=1.215' 'perl-data-visitor>=0.27' 'perl-digest-md5>=2.39' 'perl-hash-merge>=0.11' 'perl-list-moreutils>=0.22' 'perl-module-runtime>=0.013' 'perl-moose>=1.10' 'perl-moosex-attribute-env>=0.01' 'perl-moosex-types>=0.23' 'perl-path-class>=0.21' 'perl-sql-translator>=0.11006' 'perl-scalar-util>=1.23' 'perl-sub-exporter>=0.982' 'perl-test-builder>=0.96' 'perl-test-deep>=0.106' 'perl-file-temp>=0.00' 'perl-file-path>=0.00')
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/J/JJ/JJNAPIORK/${_cpanname}-${pkgver}.tar.gz) 
md5sums=('593baf888485b9d6b05efd61ca8f3407')
build() {
  cd $srcdir/${_cpanname}-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make || return 1
}
package() {
  cd $srcdir/${_cpanname}-${pkgver}
  make install DESTDIR=$pkgdir || return 1
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
