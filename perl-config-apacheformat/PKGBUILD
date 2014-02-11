# Maintainer: Charly Caulet <charly.caulet@no-log.org>
pkgname='perl-config-apacheformat'
pkgver='1.2'
pkgrel='1'
pkgdesc="Config::ApacheFormat - use Apache format config files"
arch=('i686' 'x86_64')
license=('Perl5')
options=()
depends=('perl')
url='http://search.cpan.org/~samtregar/Config-ApacheFormat-1.2/ApacheFormat.pm'
archivename='Config-ApacheFormat-1.2'
source="http://search.cpan.org/CPAN/authors/id/S/SA/SAMTREGAR/${archivename}.tar.gz"
md5sums=('3fea1c5a44f2b73a44cef830dbacce5e')

package() {
  cd ${srcdir}/${archivename}
  perl Makefile.PL PREFIX=${pkgdir}/usr
  make
  #skip tests
  #make test
  make install
}
