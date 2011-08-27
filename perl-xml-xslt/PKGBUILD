# Contributor: Alexandr Grigorcea <cahr.gr@gmail.com>

pkgname=perl-xml-xslt
_realname=XML-XSLT
pkgver=0.48
pkgrel=1
pkgdesc="A perl module for processing XSLT"
arch=("i686" "x86_64")
url="http://search.cpan.org/dist/XML-XSLT/"
license=("Artistic")
depends=('perl>=5.10.0' 'perl-xml-dom')
source=(http://search.cpan.org/CPAN/authors/id/J/JS/JSTOWE/${_realname}-$pkgver.tar.gz)
md5sums=('44d6d9e183d5c49c5d422ae42e7a9f68')
options=(!emptydirs)

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
  # Install module into the vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make test || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${startdir}/pkg -name '.packlist' -delete
  find ${startdir}/pkg -name 'perllocal.pod' -delete
}
