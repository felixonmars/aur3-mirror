#
# Contributor: max-k <max-k@post.com>
#
pkgname=perl-xml-entities
_realname=XML-Entities
pkgver=1.0001
pkgrel=1
pkgdesc="XML::Entities - Decode strings with XML entities"
url="http://search.cpan.org/dist/XML-Entities"
license=('GPL')
depends=('perl>=5.10.0' 'perl-html-parser')
arch=('i686' 'x86_64')
options=(!emptydirs)

source=(http://ftp.crihan.fr/mirrors/ftp.cpan.org/authors/id/S/SI/SIXTEASE/${_realname}-${pkgver}.tar.gz)
md5sums=('b989ba88e488fddb6ac99f6be4304220')

build() {
  cd ${startdir}/src/${_realname}

  # Install module into the vendor directory.
  /usr/bin/perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make test || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  # Remove .packlist file.
  find ${startdir}/pkg -name '.packlist' -delete
}
