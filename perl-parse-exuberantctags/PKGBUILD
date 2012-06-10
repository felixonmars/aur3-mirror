# Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>
# Contributor: Justin Davis <jrcd83@gmail.com>
pkgname='perl-parse-exuberantctags'
pkgver='1.02'
_realname='Parse-ExuberantCTags'
pkgrel='2'
pkgdesc="Efficiently parse exuberant ctags files"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/Parse-ExuberantCTags'
source=("http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/${_realname}-${pkgver}.tar.gz")
md5sums=('7ded48c5cd8061f2099c393d37979ca2')
build() {
  cd ${_realname}-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd ${_realname}-${pkgver}
  make test
}

package() {
  cd ${_realname}-${pkgver}
  make install DESTDIR=${pkgdir}
}

