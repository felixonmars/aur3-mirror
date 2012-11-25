# Maintainer: Juraj Hudak <xhudak@fi.muni.cz>

#http://search.cpan.org/CPAN/authors/id/M/MN/MNOONING/PlRPC/PlRPC-0.2020.tar.gz

pkgname='perl-plrpc'
pkgver='0.2020'
pkgrel='1'
pkgdesc='Perl extension for writing PlRPC servers and clients'
_realname='PlRPC'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-net-daemon')
url='http://search.cpan.org/~mnooning/PlRPC-0.2020/lib/Bundle/PlRPC.pm'
source=(http://search.cpan.org/CPAN/authors/id/M/MN/MNOONING/${_realname}/${_realname}-${pkgver}.tar.gz)
md5sums=('5361e137e56d037c5e796926ecb5300b')

build() {
  cd ${_realname}
  perl Makefile.PL INSTALLDIRS=vendor
  make
}
check() {
  cd ${_realname}
  make test
}
package(){
  cd ${_realname}
  make install DESTDIR=${pkgdir}
}

